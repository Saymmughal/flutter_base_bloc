import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/data/model/auth_model/forgot_password_model.dart';
import 'package:flutter_base_bloc/helper/connection_manager.dart';
import 'package:flutter_base_bloc/data/repository/api_repo.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/utils/env_configuration/env_config.dart';
import 'package:flutter_base_bloc/view/widgets/loading_dialog.dart';

import '../../view/widgets/custom_snackbar.dart';
import '../../utils/app_strings.dart';

// Events
abstract class ForgotPasswordEvent {}

class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordSubmitted({required this.email});
}

class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordEmailChanged(this.email);
}

class ForgotPasswordClearFields extends ForgotPasswordEvent {}

class ForgotPasswordClearError extends ForgotPasswordEvent {}

// States
abstract class ForgotPasswordState {
  final bool isLoading;
  final ForgotPasswordModel? forgotPasswordModel;
  final String? error;
  final String email;

  const ForgotPasswordState({
    this.isLoading = false,
    this.forgotPasswordModel,
    this.error,
    this.email = '',
  });
}

class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial() : super();
}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading() : super(isLoading: true);
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  @override
  final ForgotPasswordModel forgotPasswordModel;

  const ForgotPasswordSuccess({required this.forgotPasswordModel})
    : super(forgotPasswordModel: forgotPasswordModel);
}

class ForgotPasswordFailure extends ForgotPasswordState {
  @override
  final String error;

  const ForgotPasswordFailure({required this.error}) : super(error: error);
}

class ForgotPasswordEmailUpdated extends ForgotPasswordState {
  @override
  final String email;

  const ForgotPasswordEmailUpdated({required this.email}) : super(email: email);
}

// BLoC
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ApiRepo _apiRepo;

  ForgotPasswordBloc(this._apiRepo) : super(const ForgotPasswordInitial()) {
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordClearFields>(_onClearFields);
    on<ForgotPasswordClearError>(_onClearError);
  }

  void _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(ForgotPasswordEmailUpdated(email: event.email));
  }

  void _onClearFields(
    ForgotPasswordClearFields event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(const ForgotPasswordInitial());
  }

  void _onClearError(
    ForgotPasswordClearError event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(ForgotPasswordEmailUpdated(email: state.email));
  }

  Future<void> _onForgotPasswordSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final email = event.email.trim();

    if (email.isEmpty) {
      emit(
        ForgotPasswordFailure(error: AppStrings.pleaseEnterYourEmailAddress),
      );
      showToast(message: AppStrings.pleaseEnterYourEmailAddress);
      return;
    }

    emit(const ForgotPasswordLoading());
    loaderDialog();

    bool isConnected = ConnectionManager().isConnected;
    if (!isConnected) {
      goBack();
      emit(ForgotPasswordFailure(error: AppStrings.noInternetConnection));
      return;
    }

    debugPrint("Forgot Password API called with email: $email");

    try {
      Response response = await _apiRepo.postRequest(
        url: EnvConfig.fullForgotPasswordUrl,
        data: {AppStrings.emailField: email},
      );

      final responseBody = response.data;
      debugPrint("Forgot Password body ===============>>> $responseBody");

      final forgotPasswordModel = ForgotPasswordModel.fromJson(responseBody);

      debugPrint("Forgot Password Model: $forgotPasswordModel");

      if (response.statusCode == 200 || response.statusCode == 201) {
        goBack();
        emit(ForgotPasswordSuccess(forgotPasswordModel: forgotPasswordModel));
        showToast(message: AppStrings.passwordResetLinkSent);
      } else {
        goBack();
        String errorMessage =
            response.data["error"] ??
            "${response.statusCode} ${response.statusMessage}";
        emit(ForgotPasswordFailure(error: errorMessage));
        showToast(message: errorMessage);
      }
    } catch (e) {
      goBack();
      emit(ForgotPasswordFailure(error: e.toString()));
      debugPrint("Forgot Password Error: $e");
      showToast(message: "Something went wrong. Please try again.");
    }
  }
}

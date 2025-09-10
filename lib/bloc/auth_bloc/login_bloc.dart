import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/helper/connection_manager.dart';
import 'package:flutter_base_bloc/data/repository/api_repo.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/utils/env_configuration/env_config.dart';
import 'package:flutter_base_bloc/view/widgets/loading_dialog.dart';

import '../../data/db/shared-preferences.dart';
import '../../data/model/auth_model/login_model.dart';
import '../../helper/routes_helper.dart';
import '../../view/widgets/custom_snackbar.dart';
import '../../utils/app_strings.dart';

// Events
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}

class LoginEmailChanged extends LoginEvent {
  final String email;
  LoginEmailChanged(this.email);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged(this.password);
}

class LoginClearFields extends LoginEvent {}

class LoginClearError extends LoginEvent {}

// States
abstract class LoginState {
  final bool isLoading;
  final LoginModel? loginModel;
  final String? error;
  final String email;
  final String password;

  const LoginState({
    this.isLoading = false,
    this.loginModel,
    this.error,
    this.email = '',
    this.password = '',
  });
}

class LoginInitial extends LoginState {
  const LoginInitial() : super();
}

class LoginLoading extends LoginState {
  const LoginLoading() : super(isLoading: true);
}

class LoginSuccess extends LoginState {
  @override
  final LoginModel loginModel;

  const LoginSuccess({required this.loginModel})
    : super(loginModel: loginModel, isLoading: false);
}

class LoginFailure extends LoginState {
  @override
  final String error;

  const LoginFailure({required this.error})
    : super(error: error, isLoading: false);
}

class LoginEmailUpdated extends LoginState {
  @override
  final String email;

  const LoginEmailUpdated({required this.email}) : super(email: email);
}

class LoginPasswordUpdated extends LoginState {
  @override
  final String password;

  const LoginPasswordUpdated({required this.password})
    : super(password: password);
}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepo _apiRepo;

  LoginBloc(this._apiRepo) : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginClearFields>(_onClearFields);
    on<LoginClearError>(_onClearError);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(LoginEmailUpdated(email: event.email));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginPasswordUpdated(password: event.password));
  }

  void _onClearFields(LoginClearFields event, Emitter<LoginState> emit) {
    emit(const LoginInitial());
  }

  void _onClearError(LoginClearError event, Emitter<LoginState> emit) {
    emit(LoginEmailUpdated(email: state.email));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    loaderDialog();

    bool isConnected = ConnectionManager().isConnected;
    if (!isConnected) {
      goBack();
      emit(LoginFailure(error: AppStrings.noInternetConnection));
      return;
    }

    try {
      Response response = await _apiRepo.postRequest(
        url: EnvConfig.fullLoginUrl,
        data: {
          AppStrings.emailField: event.email,
          AppStrings.passwordField: event.password,
        },
      );

      final responseBody = response.data;
      debugPrint("Login body ===============>>> $responseBody");

      final loginModel = LoginModel.fromJson(responseBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        goBack();
        await Future.wait([
          LocalDb.storeUserData(loginModel),
          LocalDb.storeBearerToken(loginModel.token!),
          LocalDb.storeUserId(loginModel.data!.id!),
          LocalDb.storeLogin(true),
        ]);
        emit(LoginSuccess(loginModel: loginModel));
        goToNamed(RouterHelper.mainScreen);
      } else {
        goBack();
        String errorMessage =
            loginModel.error ??
            "${response.statusCode} ${response.statusMessage}";
        emit(LoginFailure(error: errorMessage));
        showToast(message: errorMessage);
      }
    } catch (e) {
      goBack();
      emit(LoginFailure(error: e.toString()));
      debugPrint("Login Error: $e");
    }
  }
}

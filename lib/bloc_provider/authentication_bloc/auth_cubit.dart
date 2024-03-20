import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/bloc_provider/authentication_bloc/auth_state.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/view/widgets/loading_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  // Login controller
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // Variables
  bool? isLoading;

  // Clear TextFields
  clearFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
    emit(AuthInitialState());
  }

  // Clear Authentication Screen
  clearAuthenticationScreen() {
    clearFields();
    emit(AuthChangeState());
  }

  // Set Loading
  setLoading(bool value) {
    isLoading = value;
    if (value == true) {
      loaderDialog();
    } else {
      goBack();
    }
    // emit(AuthChangeState());
  }
/*=================================================================================
  APIs calling
 ==================================================================================*/

  // Registeration ===================================================
}

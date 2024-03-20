import 'package:flutter_base_bloc/utils/constant.dart';

class Validation {
  // Name text field validation
  static nameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return Constant.enterYourName;
    }
  }

  static addressValidation(String? value) {
    if (value!.trim().isEmpty) {
      return Constant.enterYourAddress;
    }
  }

  // Email text field validation
  static emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return Constant.enterYourEmail;
    } else if (!RegExp(r"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}")
        .hasMatch(value.trim())) {
      return Constant.pleaseEnterValidEmail;
    } else {
      return null;
    }
  }

  // Phone text field validation
  static phoneValidation(String? value) {
    String pattern = r'^\d{10}$';
    RegExp regExp = RegExp(pattern);

    if (value!.trim().isEmpty) {
      return Constant.enterYourPhoneNumber;
    } else if (!regExp.hasMatch(value.trim())) {
      return Constant.enterValidPhoneNumber;
    }
  }

  // Password text field validation
  static passwordValidation(String? value) {
    String pattern = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%&+]).{8,}$";
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return Constant.enterYourPassword;
    } else if (!regExp.hasMatch(value.trim())) {
      return Constant.passwordValidaion;
    } else if (value.length < 8) {
      return Constant.passwordAtleast8Characters;
    }
  }

  static reEnterPasswordValidation(String? value, String confirmationValue) {
    if (value!.trim().isEmpty) {
      return Constant.enterYourPassword;
    } else if (value.toLowerCase().trim() !=
        confirmationValue.toLowerCase().trim()) {
      return Constant.passwordIsNotMatched;
    }
  }

  // Verification Code text field validation
  static verificationCodeValidation(String? value) {
    if (value!.trim().length < 6) {
      return Constant.pleaseEnterValidCode;
    } else if (value.trim().length > 6) {
      return Constant.pleaseEnterValidCode;
    }
  }

  // Cancel Reason text field validation
  static reasonValidation(String? value) {
    if (value!.trim().isEmpty) {
      return Constant.pleeaseEnterReason;
    }
  }
}

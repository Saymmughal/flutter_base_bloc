import 'package:flutter_base_bloc/utils/app_strings.dart';

class Validation {
  // Name text field validation
  static nameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourName;
    }
  }

  // Name text field validation
  static fisrtNameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourFirstName;
    }
  }

  static lastNameValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourLastName;
    }
  }

  static dateOfBirthValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterDateOfBirth;
    }
  }

  static addressValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourAddress;
    }
  }

  // Email text field validation
  static String? emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourEmail;
    } else if (!RegExp(
      r"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}",
    ).hasMatch(value.trim())) {
      return AppStrings.pleaseEnterValidEmail;
    } else {
      return null;
    }
  }

  // Phone text field validation
  static String? phoneValidation(String? value) {
    String pattern = r'^\d{10}$';
    RegExp regExp = RegExp(pattern);

    if (value!.trim().isEmpty) {
      return AppStrings.enterYourPhoneNumber;
    } else if (!regExp.hasMatch(value.trim())) {
      return AppStrings.enterValidPhoneNumber;
    } else {
      return null;
    }
  }

  // Password text field validation
  static String? passwordValidation(String? value) {
    String pattern = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%&+]).{8,}$";
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourPassword;
    } else if (!regExp.hasMatch(value.trim())) {
      return AppStrings.passwordValidation;
    } else if (value.length < 8) {
      return AppStrings.passwordAtleast8Characters;
    } else {
      return null;
    }
  }

  static reEnterPasswordValidation(String? value, String confirmationValue) {
    if (value!.trim().isEmpty) {
      return AppStrings.enterYourPassword;
    } else if (value.toLowerCase().trim() !=
        confirmationValue.toLowerCase().trim()) {
      return AppStrings.passwordIsNotMatched;
    }
  }

  // Verification Code text field validation
  static verificationCodeValidation(String? value) {
    if (value!.trim().length < 6) {
      return AppStrings.pleaseEnterValidCode;
    } else if (value.trim().length > 6) {
      return AppStrings.pleaseEnterValidCode;
    }
  }

  // Cancel Reason text field validation
  static reasonValidation(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.pleaseEnterReason;
    }
  }
}

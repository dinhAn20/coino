
import '../../generated/l10n.dart';

class Validator {
  static bool isNullOrEmpty(String? value) {
    return (value ?? '').isEmpty;
  }

  static bool isEmailValid(String? value) {
    if (value == null) {
      return false;
    }
    final RegExp rgx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return rgx.hasMatch(value);
  }

  static String? emailValidation(String? value) {
    if (Validator.isNullOrEmpty(value)) {
      return S.current.requiredEmail;
    } else if (!Validator.isEmailValid(value)) {
      return S.current.invalidEmail;
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (Validator.isNullOrEmpty(value)) {
      return S.current.requiredPassword;
    }
    return null;
  }
  static String? nameValidation(String? value) {
    if (Validator.isNullOrEmpty(value)) {
      return S.current.requiredFullName;
    }
    return null;
  }

  static String? confirmPasswordValidation(String? value, String? password) {
    if (Validator.isNullOrEmpty(value)) {
      return S.current.confirmPasswordInvalid;
    }
    if (value != password) {
      return S.current.passwordIsNotMatch;
    }
    return null;
  }


  static String? intValidation(String? value) {
    if (!Validator.isNullOrEmpty(value) && int.tryParse(value!) == null) {
      return S.current.invalidFormat;
    }
    return null;
  }

  static String? doubleValidation(String? value) {
    if (!Validator.isNullOrEmpty(value) && double.tryParse(value!) == null) {
      return S.current.invalidFormat;
    }
    return null;
  }
}

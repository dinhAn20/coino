
import '../../../common/utils/validator.dart';
import '../../../generated/l10n.dart';

class VerifyEmailValidator {
  static String? codeValidation(String? value) {
    if (Validator.isNullOrEmpty(value)) {
      return S.current.verifyCodeIsRequired;
    }
    return null;
  }
}

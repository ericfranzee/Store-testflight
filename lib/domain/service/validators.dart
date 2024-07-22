import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';

abstract class AppValidators {
  AppValidators._();

  static String? isValidEmail(String? email) {
    if (RegExp(
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
    ).hasMatch(email ?? "")) {
      return null;
    }
    return AppHelper.getTrn(TrKeys.thisNotEmail);
  }

  static String? isNotEmptyValidator(String? title) {
    if (title?.isEmpty ?? true) {
      return AppHelper.getTrn(TrKeys.thisFieldIsRequired);
    }
    return null;
  }

  static String? isNumberValidator(String? title) {
    if (title?.isEmpty ?? true) {
      return AppHelper.getTrn(TrKeys.thisFieldIsRequired);
    }
    if ((num.tryParse(title ?? "") ?? 0.0).isNegative) {
      return AppHelper.getTrn(TrKeys.thisFieldIsNotMinusOrZero);
    }
    return null;
  }


  static String? isValidPrice(String? title) {
    if (title?.isEmpty ?? true) {
      return AppHelper.getTrn(TrKeys.thisFieldIsRequired);
    } else  if ((num.tryParse(title ?? "0") ?? 0) <= 0 ) {
      return AppHelper.getTrn(TrKeys.thisFieldIsNotMinusOrZero);
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password?.isEmpty ?? true) {
      return AppHelper.getTrn(TrKeys.thisFieldIsRequired);
    } else if ((password?.length ?? 0) < 5) {
      return AppHelper.getTrn(TrKeys.passwordMinFive);
    }
    return null;
  }

  static String? isValidConfirmPassword(
      String password, String? confirmPassword) {
    if (confirmPassword?.isEmpty ?? true) {
      return AppHelper.getTrn(TrKeys.thisFieldIsRequired);
    } else if (confirmPassword != password) {
      return AppHelper.getTrn(TrKeys.passwordNoCorrect);
    }
    return null;
  }
}

class BaseValidationUtils {
  static bool isEmailValid(String email,
      {String pattern =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"}) {
    return RegExp(pattern).hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber,
      {String pattern = r'(^[0][3|4|5|7|8|9][0-9]{8}$)'}) {
    RegExp regExp = RegExp(pattern);
    if (phoneNumber.isEmpty || !regExp.hasMatch(phoneNumber)) {
      return false;
    }
    return true;
  }
}

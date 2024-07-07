class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.?[a-zA-Z]+)$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#@$!%*?&])[A-Za-z\d#@$!%*?&]{8,}$",
      caseSensitive: true,
    ).hasMatch(password);
  }

  static bool isPhoneValid(String phone) {
    return RegExp(r"^\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$")
        .hasMatch(phone);
  }
}

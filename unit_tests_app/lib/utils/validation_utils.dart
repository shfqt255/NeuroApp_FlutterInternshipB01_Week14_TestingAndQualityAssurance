class ValidationUtils {
  static bool isValidEmail(String email) {
    return email.contains('@');
  }

  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
}

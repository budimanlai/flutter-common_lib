import 'dart:math';
import 'dart:convert';

class StringHelper {
  /// Generate random string
  static String randomString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values).substring(0, len);
  }

  /// Check if string is valid email
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  /// normalize phone number
  static String normalizePhone(String phone) {
    if (phone.substring(0, 1) == "0") {
      return "62" + phone.substring(1);
    } else if (phone.substring(0, 2) == "62") {
      return phone;
    }
    return "62" + phone;
  }
}
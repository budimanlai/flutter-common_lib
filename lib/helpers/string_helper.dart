import 'dart:math';
import 'dart:convert';

class StringHelper {
  /// Generate random string
  static String randomString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values).substring(0, len);
  }
}
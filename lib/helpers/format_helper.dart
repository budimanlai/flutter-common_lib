import 'package:intl/intl.dart';

class Formatter {
  static formatCurrency(double value) {
    return NumberFormat.currency(
            locale: "id", decimalDigits: 0, symbol: "Rp.", name: "")
        .format(value);
  }

  static String formatDate(DateTime date) {
    return date.toString();
  }
}
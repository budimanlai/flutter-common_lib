import 'package:intl/intl.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  String normalizePhone() {
    if (this.substring(0, 1) == "0") {
      return "62" + this.substring(1);
    } else if (this.substring(0, 2) == "62") {
      return this;
    }
    return "62" + this;
  }

  bool isNumeric() {
    return double.tryParse(this) != null;
  }

  String toDefaultFormatDate(String fromFormat) {
    DateTime parseDate = new DateFormat(fromFormat).parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat("yyyy-MM-dd");

    return outputFormat.format(inputDate);
  }
}

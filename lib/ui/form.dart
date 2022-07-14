part of 'ui.dart';

class Form {
  // Line spacer
  static Widget spacer({double? height, Color? color}) {
    return Container(
      width: double.infinity,
      height: height ?? 7,
      color: color ?? ColorStyle.base,
    );
  }

  static Widget spacerThin() {
    return spacer(height: 1);
  }
}
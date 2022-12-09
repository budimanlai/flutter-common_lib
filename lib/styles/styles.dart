import 'package:flutter/material.dart';
import 'color.dart';

class Style {
  // Button Style
  static ButtonStyle capsuleButton({Color? color}) {
    return ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorStyle.primaryBase,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));
  }

  static ButtonStyle capsuleButtonSecondaryA() {
    return ElevatedButton.styleFrom(
      backgroundColor: ColorStyle.secondaryaBase,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }

  static ButtonStyle flatButtonWhite() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  static ButtonStyle flatButtonGrey() {
    return ElevatedButton.styleFrom(
      foregroundColor: ColorStyle.dark, backgroundColor: ColorStyle.light,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  static double getMinButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8;
  }

  // Text
  static TextStyle textFormLabel() {
    return TextStyle(
        color: ColorStyle.primaryBase, fontWeight: FontWeight.bold);
  }

  static BoxDecoration boxCorner(Color color, [double? radius]) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)));
  }
}

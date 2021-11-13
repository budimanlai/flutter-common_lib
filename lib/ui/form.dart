import 'package:flutter/material.dart';
import 'package:common_lib/styles/styles.dart';
import 'package:common_lib/styles/color.dart';

class Form {
  static Widget textFormField(
      {required String title,
      String? initialValue,
      bool? readOnly,
      bool? obscureText,
      TextInputType? keyboardType,
      TextEditingController? controller,
      TextInputAction? inputAction,
      Widget? suffix,
      int maxLines = 1,
      String? hint,
      Function(String)? onFieldSubmitted,
      Function()? onTap,
      Function(String? value)? validator,
      Function(String? value)? onSaved}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Style.textFormLabel(),
          ),
          TextFormField(
            controller: controller,
            initialValue: controller == null ? (initialValue ?? "") : null,
            autocorrect: false,
            autofocus: false,
            readOnly: readOnly ?? false,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType ?? TextInputType.text,
            textInputAction: inputAction,
            maxLines: maxLines,
            validator: (value) {
              if (validator != null) {
                return validator(value);
              } else {
                return null;
              }
            },
            onFieldSubmitted: (v) {
              if (onFieldSubmitted != null) {
                onFieldSubmitted(v);
              }
            },
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            onSaved: (v) {
              if (onSaved != null) {
                onSaved(v);
              }
            },
            decoration: InputDecoration(hintText: hint, suffixIcon: suffix),
          ),
        ],
      ),
    );
  }

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

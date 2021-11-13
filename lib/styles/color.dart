import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:common_lib/extensions/color.dart';

class ColorStyle {
  static Color primaryBase = Color(0xffdc192d);
  static Color primaryLight = Color(0xffe62832);
  static Color primaryDark = Color(0xffbe192d);

  static Color secondaryaBase = Color(0xff00cb64);
  static Color secondaryaLight = Color(0xff5af188);
  static Color secondaryaDark = Color(0xff00be64);

  static Color secondarybBase = Color(0xff0071ff);
  static Color secondarybLight = Color(0xff00c0ca);

  static Color light = Color(0xffeeeeee);
  static Color base = Color(0xffb4b4b4);
  static Color mediumDark = Color(0xff646464);
  static Color dark = Color(0xff323232);

  static loadFromJson(String jsonString) {
    final obj = json.decode(jsonString);

    if (obj['primary_base']) { primaryBase = (obj['prinary_base'] as String).toColor(); }
    if (obj['primary_light']) { primaryLight = (obj['primary_light'] as String).toColor(); }
    if (obj['primary_dark']) { primaryDark = (obj['primary_dark'] as String).toColor(); }
    if (obj['secondarya_base']) { secondaryaBase = (obj['secondarya_base'] as String).toColor(); }
    if (obj['secondarya_light']) { secondaryaLight = (obj['secondary_alight'] as String).toColor(); }
    if (obj['secondarya_dark']) { secondaryaDark = (obj['secondarya_dark'] as String).toColor(); }
    if (obj['secondaryb_dark']) { secondarybBase = (obj['secondaryb_dark'] as String).toColor(); }
    if (obj['secondaryb_light']) { secondarybLight = (obj['secondaryb_light'] as String).toColor(); }
    if (obj['light']) { light = (obj['light'] as String).toColor(); }
    if (obj['base']) { base = (obj['base'] as String).toColor(); }
    if (obj['medium_dark']) { mediumDark = (obj['medium_dark'] as String).toColor(); }
    if (obj['dark']) { dark = (obj['dark'] as String).toColor(); }
  }
}
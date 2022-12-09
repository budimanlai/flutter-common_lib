import 'package:common_lib/extensions/color.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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

  static fromJsonFile(String path) async {
    final String response = await rootBundle.loadString(path);
    final Map<String, dynamic> json = jsonDecode(response);
    loadFromJson(json);
  }

  static loadFromJson(Map<String, dynamic> jsonObject) {
    if (jsonObject.containsKey('primary_base')) { primaryBase = (jsonObject['primary_base'] as String).toColor(); }
    if (jsonObject.containsKey('primary_light')) { primaryLight = (jsonObject['primary_light'] as String).toColor(); }
    if (jsonObject.containsKey('primary_dark')) { primaryDark = (jsonObject['primary_dark'] as String).toColor(); }
    if (jsonObject.containsKey('secondarya_base')) { secondaryaBase = (jsonObject['secondarya_base'] as String).toColor(); }
    if (jsonObject.containsKey('secondarya_light')) { secondaryaLight = (jsonObject['secondary_alight'] as String).toColor(); }
    if (jsonObject.containsKey('secondarya_dark')) { secondaryaDark = (jsonObject['secondarya_dark'] as String).toColor(); }
    if (jsonObject.containsKey('secondaryb_dark')) { secondarybBase = (jsonObject['secondaryb_dark'] as String).toColor(); }
    if (jsonObject.containsKey('secondaryb_light')) { secondarybLight = (jsonObject['secondaryb_light'] as String).toColor(); }
    if (jsonObject.containsKey('light')) { light = (jsonObject['light'] as String).toColor(); }
    if (jsonObject.containsKey('base')) { base = (jsonObject['base'] as String).toColor(); }
    if (jsonObject.containsKey('medium_dark')) { mediumDark = (jsonObject['medium_dark'] as String).toColor(); }
    if (jsonObject.containsKey('dark')) { dark = (jsonObject['dark'] as String).toColor(); }
  }
}
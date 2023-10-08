import 'package:flutter/material.dart';

class SermanosColors {
  SermanosColors._();

  static const int primaryDefaultValue = 0xFF14903F;
  static const int secondaryDefaultValue = 0xFF0D47A1;
  static const int errorDefaultValue = 0xFFB3261E;
  //primary color #14903F
  static const MaterialColor primary = MaterialColor(
      primaryDefaultValue, <int, Color>{
    100: Color(primaryDefaultValue),
    10: Color(0xFFE7F4EC),
    5: Color(0xFFF3F9F5)
  });
  static const MaterialColor secondary = MaterialColor(
      secondaryDefaultValue, <int, Color>{200: Color(secondaryDefaultValue)});
  static const neutralDefault = Color(0xFF666666);
  static const MaterialColor error = MaterialColor(
      errorDefaultValue, <int, Color>{100: Color(errorDefaultValue)});
}

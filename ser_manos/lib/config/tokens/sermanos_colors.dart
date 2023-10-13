import 'package:flutter/material.dart';

class SermanosColors {
  SermanosColors._();

  static const int _primaryDefaultValue = 0xFF14903F;
  static const int _secondaryDefaultValue = 0xFF0D47A1;
  static const int _errorDefaultValue = 0xFFB3261E;
  static const int _neutralDefaultValue = 0xFF191919;

  //primary color #14903F
  static const MaterialColor primary = MaterialColor(
      _primaryDefaultValue, <int, Color>{
    100: Color(_primaryDefaultValue),
    10: Color(0xFFE7F4EC),
    5: Color(0xFFF3F9F5)
  });
  static const MaterialColor secondary = MaterialColor(
      _secondaryDefaultValue, <int, Color>{200: Color(_secondaryDefaultValue)});
  static const MaterialColor neutral = MaterialColor(
      _neutralDefaultValue, <int, Color>{
    100: Color(_neutralDefaultValue),
    75: Color(0xFF666666),
    0: Color(0xFFFFFFFF)
  });
  static const MaterialColor error = MaterialColor(
      _errorDefaultValue, <int, Color>{100: Color(_errorDefaultValue)});
// static const Color primary = Color(0xFF14903F);
// static const Color secondary = Color(0xFF0D47A1);
// static const Color grey = Color(0xFF666666);
// static const Color red = Color(0xFFB3261E);
// static const Color secondaryLight = Color(0xFFCAE5FB);
// static const Color greyLight = Color(0xFFFAFAFA);
// >>>>>>> Stashed changes
}

import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

class SermanosTypography extends TextStyle {
  const SermanosTypography(
      {required FontWeight fontWeight,
      required double fontSize,
      required Color color,
      required double letterSpacing})
      : super(
            fontFamily: 'Roboto',
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            letterSpacing: letterSpacing);

  static const double _fontSizeXs = 10;
  static const double _fontSizeLg = 16;

  static const Map<String, double> _fontSize = {
    'xs': 10.0,
    'sm': 12.0,
    'md': 14.0,
    'lg': 16.0,
    'xl': 20.0,
    'xxl': 24.0
  };

  const SermanosTypography.overline({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSizeXs,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5);

  const SermanosTypography.subtitle01({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSizeLg,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15);

  SermanosTypography.defaultBody({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSize['md']!,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25);

  SermanosTypography.body02({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSize['sm']!,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4);

  SermanosTypography.defaultHeadline({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSize['xl']!,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15);

  SermanosTypography.headline01({
    Color color = SermanosColors.neutral100,
  }) : this(
            color: color,
            fontSize: _fontSize['xxl']!,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15);
}

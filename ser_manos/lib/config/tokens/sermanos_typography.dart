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
          letterSpacing: letterSpacing,
        );

  static const double _fontSizeXs = 10;
  static const double _fontSizeSm = 12;
  static const double _fontSizeMd = 14;
  static const double _fontSizeLg = 16;
  static const double _fontSizeXl = 20;
  static const double _fontSizeXxl = 24;

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

  const SermanosTypography.body01({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSizeMd,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25);

  const SermanosTypography.body02({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSizeSm,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4);

  const SermanosTypography.defaultHeadline({color = SermanosColors.neutral100})
      : this(
            color: color,
            fontSize: _fontSizeXl,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15);

  const SermanosTypography.headline01({
    Color color = SermanosColors.neutral100,
  }) : this(
            color: color,
            fontSize: _fontSizeXxl,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15);

  const SermanosTypography.headline02({
    Color color = SermanosColors.neutral100,
  }) : this(
            color: color,
            fontSize: _fontSizeXl,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15);

  const SermanosTypography.button({
    Color color = SermanosColors.neutral100,
  }) : this(
            color: color,
            fontSize: _fontSizeMd,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1);
}

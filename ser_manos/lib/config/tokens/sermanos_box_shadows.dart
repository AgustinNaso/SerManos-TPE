import 'package:flutter/material.dart';

class Shadows  {
  Shadows._();

  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
}

//example on how to call shadows:
// decoration: BoxDecoration(
//   color: SermanosColors.neutral[78],
//   borderRadius: BorderRadius.circular(2),
//   boxShadow: Shadows.primaryShadow,
// ),

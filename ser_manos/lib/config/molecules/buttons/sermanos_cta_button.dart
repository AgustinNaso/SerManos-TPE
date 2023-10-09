import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosCtaButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Icon? icon;

  const SermanosCtaButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.backgroundColor = SermanosColors.primary,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: icon != null? MainAxisSize.min: MainAxisSize.max,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

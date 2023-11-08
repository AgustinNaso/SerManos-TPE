import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosCtaButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Icon? icon;
  final bool enabled;

  const SermanosCtaButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.enabled = true,
      this.backgroundColor = SermanosColors.primary100,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: enabled ? backgroundColor : SermanosColors.neutral25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: icon != null ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: enabled ? textColor : SermanosColors.neutral50,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

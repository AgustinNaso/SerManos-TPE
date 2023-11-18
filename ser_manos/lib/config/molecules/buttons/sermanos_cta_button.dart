import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosCtaButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Icon? icon;
  final bool enabled;
  final bool filled;
  final bool loading;

  const SermanosCtaButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.filled = true,
      this.icon,
      this.loading = false,
      this.enabled = true,
      this.backgroundColor = SermanosColors.primary100,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return filled
        ? FilledButton(
            onPressed: enabled ? onPressed : null,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor:
                  enabled ? backgroundColor : SermanosColors.neutral25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: icon != null ? MainAxisSize.min : MainAxisSize.max,
              children: [
                if (icon != null) icon!,
                loading
                    ? const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          color: SermanosColors.neutral0,
                        ),
                      )
                    : Text(
                        text,
                        style: SermanosTypography.button(
                          color: enabled ? textColor : SermanosColors.neutral50,
                        ),
                      ),
              ],
            ),
          )
        : TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
            onPressed: !enabled ? null : onPressed,
            child: loading
                ? const SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(
                      color: SermanosColors.neutral0,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Roboto', // TODO: check this
                      color: enabled
                          ? SermanosColors.primary100
                          : SermanosColors.neutral0,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          );
  }
}

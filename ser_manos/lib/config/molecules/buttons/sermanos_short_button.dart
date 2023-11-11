import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class SermanosShortButton extends StatelessWidget {
  const SermanosShortButton(
      {Key? key,
      this.icon,
      required this.text,
      required this.onPressed,
      this.textColor = SermanosColors.neutral0,
      this.filled = true,
      this.enabled = true,
      this.loading = false,
      this.boxColor})
      : super(key: key);

  final Icon? icon;
  final String text;
  final VoidCallback onPressed;
  final bool filled;
  final bool enabled;
  final bool loading;
  final Color textColor;
  final Color? boxColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null
            ? TextButton.icon(
                onPressed: loading | !enabled ? null : onPressed,
                icon: icon!,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SermanosColors.primary100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(
                    12.0,
                  ),
                ),
                label: Center(
                  child: loading
                      ? SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator(
                            color: textColor,
                          ),
                        )
                      : Text(
                          text,
                          style: SermanosTypography.button(
                            color: textColor,
                          ),
                        ),
                ),
              )
            : filled
                ? FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: SermanosColors.primary100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                    ),
                    onPressed: loading | !enabled ? null : onPressed,
                    child: Center(
                      child: loading
                          ? SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                color: textColor,
                              ),
                            )
                          : Text(
                              text,
                              style: SermanosTypography.button(
                                color: textColor,
                              ),
                            ),
                    ),
                  )
                : TextButton(
                    onPressed: loading | !enabled ? null : onPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // <-- Radius
                      ),
                      padding: const EdgeInsets.all(
                        12.0,
                      ),
                    ),
                    child: Center(
                      child: loading
                          ? SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                color: textColor,
                              ),
                            )
                          : Text(
                              text,
                              style: SermanosTypography.button(
                                color: textColor,
                              ),
                            ),
                    ),
                  ),
      ],
    );
  }
}

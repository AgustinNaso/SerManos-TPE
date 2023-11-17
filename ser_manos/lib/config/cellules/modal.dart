import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_short_button.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class Modal extends StatelessWidget {
  final String? title;
  final String subtitle;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onAccept;

  const Modal(
      {Key? key,
      this.title,
      required this.subtitle,
      required this.onAccept,
      required this.primaryButtonText,
      required this.secondaryButtonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          decoration: BoxDecoration(
              color: SermanosColors.neutral0,
              borderRadius: BorderRadius.circular(4),
              boxShadow: SermanosShadows.shadow3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: const SermanosTypography.subtitle01(),
                textAlign: TextAlign.start,
              ),
              if (title != null)
                Column(
                  children: [
                    Text(
                      title!,
                      style: const SermanosTypography.headline02(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SermanosShortButton(
                    text: secondaryButtonText,
                    onPressed: () {
                      GoRouter.of(context).pop(true);
                    },
                    filled: false,
                  ),
                  SermanosShortButton(
                      text: primaryButtonText,
                      onPressed: () =>
                          {onAccept(), GoRouter.of(context).pop(true)},
                      filled: false)
                ],
              )
            ],
          )),
    );
  }
}

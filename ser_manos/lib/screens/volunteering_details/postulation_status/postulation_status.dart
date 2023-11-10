import 'package:flutter/material.dart';
import '../../../config/molecules/buttons/sermanos_cta_button.dart';
import '../../../config/tokens/sermanos_typography.dart';

class PostulationStatus extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;
  const PostulationStatus(
      {Key? key,
      this.title = '',
      required this.description,
      required this.buttonText,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title.isNotEmpty) PostulationStatusHeader(title: title),
        Text(description,
            style: const SermanosTypography.body01(),
            textAlign: TextAlign.center),
        const SizedBox(height: 8),
        SermanosCtaButton(
          text: buttonText,
          onPressed: onButtonPressed,
          filled: false,
        )
      ],
    );
  }
}

class PostulationStatusHeader extends StatelessWidget {
  final String title;
  const PostulationStatusHeader({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const SermanosTypography.headline02()),
        const SizedBox(height: 8)
      ],
    );
  }
}

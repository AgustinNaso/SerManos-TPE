import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

import '../../tokens/sermanos_typography.dart';

class NewsCardInfo extends StatelessWidget {
  const NewsCardInfo({
    super.key,
    required this.source,
    required this.title,
    required this.subtitle,
  });
  final String source;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                source.toUpperCase(),
                style: SermanosTypography(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: SermanosColors.neutral75!,
                    letterSpacing: 1.5),
              ),
              Text(
                title,
                style: const SermanosTypography(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: SermanosColors.neutral100,
                    letterSpacing: 0.15),
              ),
              Text(
                subtitle,
                style: SermanosTypography(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: SermanosColors.neutral75!,
                    letterSpacing: 0.4),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () => context.pushNamed('newsDetail'),
              child: const Text(
                'Leer más',
                style: TextStyle(
                    color: SermanosColors.primary100,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 0.1),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

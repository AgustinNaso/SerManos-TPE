import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/data/models/news_model.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../tokens/sermanos_typography.dart';

class NewsCardInfo extends StatelessWidget {
  const NewsCardInfo({
    super.key,
    required this.news,
  });
  final News news;

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
                news.source.toUpperCase(),
                style: const SermanosTypography.overline(
                    color: SermanosColors.neutral75,
                ),
              ),
              Text(
                news.title,
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral100,
                    ),
              ),
              Text(
                news.subtitle,
                style: const SermanosTypography.body02(
                    color: SermanosColors.neutral75,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () => GoRouter.of(context).pushNamed('newsDetail', pathParameters: {'id': news.id}),
              child: Text(
                AppLocalizations.of(context)!.knowMore,
                style: const TextStyle(
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

import 'package:flutter/material.dart';
import '../../../data/models/news_model.dart';
import '../../tokens/sermanos_box_shadows.dart';
import 'news_card_info.dart';
import '../../tokens/sermanos_colors.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow1,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(news.imgUrl, width: 118, fit: BoxFit.cover),
              Expanded(
                  child: NewsCardInfo(
                      news: news,))
            ],
          ),
        ),
      ),
      onTap: () async {
        // await ref.read(firebaseAnalyticsProvider).logSelectContent(
        //   contentType: 'News',
        //   itemId: news.id,
        // );
        // if (context.mounted) {
        //   context.beamToNamed(NewsDetailsScreen.routeFromId(news.id));
        // }
      },
    );
  }
}

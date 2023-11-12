import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/news_card/news_card_info.dart';
import 'package:ser_manos/config/molecules/images/sermanos_cached_network_image.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/data/models/news_model.dart';


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
              SermanosCachedNetworkImage(imageUrl: news.imgUrl, width: 118),
              Expanded(
                  child: NewsCardInfo(
                      news: news,))
            ],
          ),
        ),
      ),
    );
  }
}

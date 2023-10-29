import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../tokens/sermanos_box_shadows.dart';
import 'news_card_info.dart';
import '../../tokens/sermanos_colors.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: Shadows.shadow1,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                  width: 118, fit: BoxFit.cover, "assets/images/novedades.png"),
              Expanded(
                child: NewsCardInfo(
                    source: 'reporte 2820',
                    title: 'Ser donante voluntario',
                    subtitle:
                        'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre'),
              )
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

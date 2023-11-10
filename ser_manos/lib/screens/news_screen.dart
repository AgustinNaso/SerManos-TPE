import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/providers/Future/news_provider.dart';

import '../config/cellules/news_card/news_card.dart';
import '../config/tokens/sermanos_colors.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureNewsList = ref.watch(getNewsProvider);
    return futureNewsList.when(
        data: (newsList) {
          return Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
              color: SermanosColors.secondary10,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return NewsCard(news: newsList[index]);
                    },
                    separatorBuilder: ((context, index) => const SizedBox(
                          height: 24,
                        )),
                    itemCount: newsList.length),
              );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())));
  }
}

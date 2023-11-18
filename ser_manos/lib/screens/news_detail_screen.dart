import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/molecules/images/sermanos_cached_network_image.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/providers/Future/news_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class NewsDetailScreen extends ConsumerWidget {
  final String newsId;
  const NewsDetailScreen({Key? key, required this.newsId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureNews = ref.watch(getNewsByIdProvider(newsId));
    return futureNews.when(
        data: (newsData) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.newsAppBar,
                  style: const SermanosTypography.subtitle01(
                      color: SermanosColors.primary10),
                ),
                centerTitle: true,
                leading: const BackButton(
                  color: SermanosColors.primary10,
                ),
                backgroundColor: SermanosColors.secondary100,
              ),
              body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        newsData.source,
                        style: const SermanosTypography.overline(
                          color: SermanosColors.neutral75,
                        ),
                      ),
                      Text(
                        newsData.title,
                        style: const SermanosTypography.subtitle01(
                          color: SermanosColors.neutral100,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SermanosCachedNetworkImage(
                          imageUrl: newsData.imgUrl,
                          height: 160,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        newsData.subtitle,
                        style: const SermanosTypography.subtitle01(
                            color: SermanosColors.secondary200),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        newsData.body,
                        style: const SermanosTypography.body01(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.shareNews,
                        style: const SermanosTypography.defaultHeadline(),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        child: SermanosCtaButton(
                            text: AppLocalizations.of(context)!.share,
                            onPressed: () async {
                              final response = await Dio().get(
                                newsData.imgUrl,
                                options: Options(
                                  responseType: ResponseType.bytes,
                                ),
                              );
                              final List<int> bytes = response.data;

                              final temp = await getTemporaryDirectory();
                              final path = '${temp.path}/image.jpg';

                              File(path).writeAsBytesSync(bytes);
                              final shareResult = await Share.shareXFiles(
                                subject: AppLocalizations.of(context)!
                                    .sharementSubject,
                                [XFile(path)],
                                text:
                                    '${AppLocalizations.of(context)!.sharementMessage}\n${newsData.subtitle}\nsermanos.com.ar/newsDetail/$newsId',
                              );

                              if (shareResult.status ==
                                  ShareResultStatus.success) {
                                print(AppLocalizations.of(context)!
                                    .sharementThanks);
                              }
                            }),
                      )
                    ],
                  )));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())));
  }
}

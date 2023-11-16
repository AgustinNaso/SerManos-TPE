import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/providers/Future/news_provider.dart';
import 'package:ser_manos/screens/news_detail_screen.dart';
import '../mocks/providers/news_provider_mock.dart';


void main() {
  testWidgets(
    'News Golden Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en'),
          delegates: AppLocalizations.localizationsDelegates,
          child: ProviderScope(
            overrides: [
              // getNewsProvider.overrideWith((ref) => getMockedNews(ref))
              getNewsByIdProvider('1').overrideWith((ref) => getMockedNewsById(ref))
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: NewsDetailScreen(newsId: '1',),
            ),
          ),
        ),
      );

      await expectLater(

        find.byType(NewsDetailScreen),
        matchesGoldenFile('./images/news_detail_screen.png'),
      );
    },
  );
}
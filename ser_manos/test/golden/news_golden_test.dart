import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/config/cellules/complete_profile.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/config/cellules/edit_profile_data_form.dart';
import 'package:ser_manos/providers/Future/news_provider.dart';
import 'package:ser_manos/screens/edit_profile.dart';
import 'package:ser_manos/screens/news_screen.dart';
import '../mocks/mocked_complete_user.dart';
import '../mocks/providers/get_news.dart';


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
              getNewsProvider.overrideWith((ref) => getMockedNews(ref))
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: NewsScreen(),
            ),
          ),
        ),
      );

      await expectLater(

        find.byType(NewsScreen),
        matchesGoldenFile('./images/news_screen.png'),
      );
    },
  );
}
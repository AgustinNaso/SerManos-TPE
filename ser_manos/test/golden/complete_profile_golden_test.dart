import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/config/cellules/complete_profile.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import '../mocks/mocked_complete_user.dart';


void main() {
  testWidgets(
    'Complete Profile Golden Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en'),
          delegates: AppLocalizations.localizationsDelegates,
          child: ProviderScope(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CompleteProfile(user: mockedCompleteUser),
            ),
          ),
        ),
      );

      await expectLater(

        find.byType(CompleteProfile),
        matchesGoldenFile('./images/complete_profile.png'),
      );
    },
  );
}
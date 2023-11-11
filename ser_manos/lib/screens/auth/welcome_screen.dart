import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

import '../../config/molecules/buttons/sermanos_cta_button.dart';
import '../../config/tokens/sermanos_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset('assets/images/logo_big.png', height: 150.0),
            const SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.welcome,
              style: const SermanosTypography.headline01(
                  color: SermanosColors.neutral100),
            ),
            const SizedBox(height: 48),
            Text(
              AppLocalizations.of(context)!.welcomeMotivation,
              style: const SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 146),
            SermanosCtaButton(
                text: AppLocalizations.of(context)!.start,
                onPressed: () {
                  GoRouter.of(context).pushReplacementNamed('home');
                }),
            const SizedBox(height: 92),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

import '../../config/molecules/buttons/sermanos_cta_button.dart';
import '../../config/tokens/sermanos_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
            // Replace with your logo
            const SizedBox(height: 32),
            Text(
              AppLocalizations.of(context)!.introduction,
              style: const SermanosTypography.subtitle01(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 181),
            SermanosCtaButton(
                text: AppLocalizations.of(context)!.login,
                onPressed: () {
                  throw UnimplementedError();
                  GoRouter.of(context).pushReplacementNamed('login');
                }),
            const SizedBox(height: 16),
            SermanosCtaButton(
              onPressed: () {
                GoRouter.of(context).pushReplacementNamed('register');
              },
              text: AppLocalizations.of(context)!.signup,
              backgroundColor: Colors.transparent,
              textColor: SermanosColors.primary100,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ));
  }
}

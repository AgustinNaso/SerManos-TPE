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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo_big.png', height: 150.0),
                  // Replace with your logo
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                    AppLocalizations.of(context)!.introduction,
                    style: const SermanosTypography.subtitle01(),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  SermanosCtaButton(
                      text: AppLocalizations.of(context)!.login,
                      onPressed: () {
                        GoRouter.of(context).pushReplacementNamed('login');
                      }),
                  const SizedBox(height: 10),
                  SermanosCtaButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacementNamed('register');
                    },
                    text: AppLocalizations.of(context)!.signup,
                    backgroundColor: Colors.transparent,
                    textColor: SermanosColors.primary100,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

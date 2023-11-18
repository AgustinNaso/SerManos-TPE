import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/providers/auth_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';

import '../../config/molecules/buttons/sermanos_cta_button.dart';
import '../../config/tokens/sermanos_colors.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(firebaseAuthProvider).currentUser() != null) {
      ref
          .read(loggedUserProvider.notifier)
          .refresh()
          .then((value) => GoRouter.of(context).pushReplacementNamed('home'));
    }

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

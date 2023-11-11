import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/cellules/login_form.dart';
import 'package:ser_manos/config/molecules/buttons/login_button.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../config/molecules/buttons/sermanos_cta_button.dart';
import '../../config/tokens/sermanos_colors.dart';

class LoginScreen extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();

  LoginScreen({super.key});

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
                  const SizedBox(height: 32),
                  const LoginForm(),
                  const SizedBox(height: 147),
                  const LoginButton(),
                  const SizedBox(height: 16),
                  SermanosCtaButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacementNamed('register');
                    },
                    text: AppLocalizations.of(context)!.noAccount,
                    backgroundColor: Colors.transparent,
                    textColor: SermanosColors.primary100,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            )));
  }
}

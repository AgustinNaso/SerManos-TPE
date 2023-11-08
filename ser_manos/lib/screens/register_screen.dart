import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/buttons/register_button.dart';
import 'package:ser_manos/data/services/firebase_auth.dart';

import '../config/cellules/register_form.dart';
import '../config/molecules/buttons/sermanos_cta_button.dart';
import '../config/tokens/sermanos_colors.dart';

class RegisterScreen extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo_big.png', height: 150.0),
                  const SizedBox(height: 20),
                  const RegisterForm(),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    const RegisterButton(),
                    const SizedBox(height: 10),
                    SermanosCtaButton(
                      onPressed: () {
                        GoRouter.of(context).pushReplacementNamed('login');
                      },
                      text: 'Ya tengo cuenta',
                      backgroundColor: Colors.white,
                      textColor: SermanosColors.primary100,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

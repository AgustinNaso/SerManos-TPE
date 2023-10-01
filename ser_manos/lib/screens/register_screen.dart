
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';

import '../config/molecules/buttons/sermanos_cta_button.dart';
import '../config/molecules/textfields/validators.dart';
import '../config/tokens/sermanos_colors.dart';

class RegisterScreen extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/logo.png', height: 150.0),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // Set horizontal margin
                      child: SermanosTextField(
                          hintText: 'Nombre',
                          labelText: 'Nombre',
                          validators: [
                            Validators.nonEmpty(),
                            // Validators().maxLength(20) //TODO: Fix maxLength
                          ],),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // Set horizontal margin
                      child: SermanosTextField(
                          hintText: 'Apellido',
                          labelText: 'Apellido',
                          validators: [
                            Validators.nonEmpty(),
                            // Validators().maxLength(20) //TODO: Fix maxLength
                          ]
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // Set horizontal margin
                      child: SermanosTextField(
                          hintText: 'Email',
                          labelText: 'Email',
                          validators:[ Validators.nonEmpty(), Validators.email() ]
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // Set horizontal margin
                      child: SermanosTextField(
                          hintText: 'Password',
                          labelText: 'Password',
                          enableObscure: true,
                          validators: [
                            Validators.nonEmpty(),
                            Validators.minLength(8)
                          ]
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
                        text: 'Registrarse',
                        onPressed: () {
                          // TODO: Navigate to login screen
                        }),
                    const SizedBox(height: 10),
                    SermanosCtaButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed('login');
                      },
                      text: 'Ya tengo cuenta',
                      backgroundColor: Colors.white,
                      textColor: SermanosColors.primary,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

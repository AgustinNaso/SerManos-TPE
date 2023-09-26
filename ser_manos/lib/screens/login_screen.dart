
import 'package:flutter/material.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';

import '../config/molecules/buttons/sermanos_cta_button.dart';
import '../config/molecules/textfields/validators.dart';

class LoginScreen extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();

  LoginScreen({super.key});

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
                          hintText: 'Email', labelText: 'Email', validators: [ Validators.nonEmpty(), Validators.email() ],),
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
                        text: 'Login',
                        onPressed: () {
                          // TODO: Navigate to login screen
                        }),
                    const SizedBox(height: 10),
                    SermanosCtaButton(
                      onPressed: () {
                        // TODO: Navigate to register screen
                      },
                      text: 'Register',
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
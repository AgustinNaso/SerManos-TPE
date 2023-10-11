import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/molecules/buttons/sermanos_cta_button.dart';
import '../config/tokens/sermanos_colors.dart';

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
                  Image.asset('assets/images/logo.png', height: 150.0),
                  // Replace with your logo
                  const SizedBox(height: 20),
                  const Text(
                    '"El esfuerzo desitnteresado para llevar alegria a los demas sera el comienzo de una vida mas feliz para nosotros"',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    SermanosCtaButton(
                        text: 'Iniciar Sesion',
                        onPressed: () {
                          GoRouter.of(context).push('/news');
                        }),
                    const SizedBox(height: 10),
                    SermanosCtaButton(
                      onPressed: () {
                        GoRouter.of(context).push('/register');
                      },
                      text: 'Registrarse',
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

import 'config/molecules/sermanos_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: SermanosColors.primary),
          useMaterial3: true,
        ),
        home: LoginScreen());
  }
}

class LoginScreen extends StatelessWidget {
  bool hasFocus = false;
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
                      child: const SermanosTextField(
                          hintText: 'Email', labelText: 'Email'),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // Set horizontal margin
                      child: const SermanosTextField(
                          hintText: 'Password',
                          labelText: 'Password',
                          enableObscure: true),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to login screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 15),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to register screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 15),
                    ),
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to login screen
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to register screen
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15),
                  ),
                  child: const Text('Register'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

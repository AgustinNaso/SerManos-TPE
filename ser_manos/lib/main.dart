import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/screens/login_screen.dart';
import 'package:ser_manos/screens/onboarding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  final _router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
        ),
      ],
    ),
  ],);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SermanosColors.primary),
        useMaterial3: true,
      ),
    );
  }
}

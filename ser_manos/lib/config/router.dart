import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/main.dart';
import 'package:ser_manos/screens/login_screen.dart';
import 'package:ser_manos/screens/onboarding_screen.dart';

mixin RouterMixin on State<MyApp> {
  final _router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'login',
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
        ),
      ],
    ),
  ],);

  GoRouter get router => _router;
}
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/main.dart';
import 'package:ser_manos/screens/auth/onboarding_screen.dart';
import 'package:ser_manos/screens/auth/register_screen.dart';
import 'package:ser_manos/screens/auth/welcome_screen.dart';
import 'package:ser_manos/screens/home_screen.dart';
import 'package:ser_manos/screens/auth/login_screen.dart';
import 'package:ser_manos/screens/news_detail_screen.dart';
import 'package:ser_manos/screens/news_screen.dart';
import 'package:ser_manos/screens/volunteering_screen.dart';

mixin RouterMixin on State<MyApp> {
  final _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
        routes: <RouteBase>[
          GoRoute(
              path: 'welcome',
              name: 'welcome',
              builder: (context, state) {
                return const WelcomeScreen();
              }),
          GoRoute(
            name: 'login',
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return LoginScreen();
            },
          ),
          GoRoute(
            name: 'register',
            path: 'register',
            builder: (BuildContext context, GoRouterState state) {
              return RegisterScreen();
            },
          ),
          GoRoute(
            name: 'news',
            path: 'news',
            builder: (BuildContext context, GoRouterState state) {
              return const NewsScreen();
            },
          ),
          GoRoute(
            name: 'newsDetail',
            path: 'news/1', //TODO: Change this to a dynamic path
            builder: (BuildContext context, GoRouterState state) {
              return const NewsDetailScreen();
            },
          ),
          GoRoute(
            name: 'home',
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            name: 'volunteering',
            path: 'volunteering/:id',
            builder: (BuildContext context, GoRouterState state) {
              return const VolunteeringScreen();
            },
          )
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}

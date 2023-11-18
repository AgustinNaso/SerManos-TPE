import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/main.dart';
import 'package:ser_manos/screens/auth/onboarding_screen.dart';
import 'package:ser_manos/screens/auth/register_screen.dart';
import 'package:ser_manos/screens/auth/welcome_screen.dart';
import 'package:ser_manos/screens/edit_profile.dart';
import 'package:ser_manos/screens/home_screen.dart';
import 'package:ser_manos/screens/auth/login_screen.dart';
import 'package:ser_manos/screens/news_detail_screen.dart';
import 'package:ser_manos/screens/news_screen.dart';
import 'package:ser_manos/screens/volunteering_details/volunteering_screen.dart';

mixin RouterMixin on State<MyApp> {
  final _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          name: 'onboarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          }),
      GoRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, state) {
            return const WelcomeScreen();
          }),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return RegisterScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
              name: 'news',
              path: 'news',
              builder: (BuildContext context, GoRouterState state) {
                return const NewsScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  name: 'newsDetail',
                  path: '/newsDetail/:id',
                  builder: (BuildContext context, GoRouterState state) {
                    final String newsId = state.pathParameters['id']!;
                    return NewsDetailScreen(newsId: newsId);
                  },
                ),
              ]),
          GoRoute(
            name: 'volunteering',
            path: '/volunteering/:id',
            builder: (BuildContext context, GoRouterState state) {
              final String volunteeringId = state.pathParameters['id']!;
              return VolunteeringScreen(volunteeringId: volunteeringId);
            },
          ),
          GoRoute(
            path: '/editProfile',
            name: 'editProfile',
            builder: (BuildContext context, GoRouterState state) {
              return const EditProfileScreen();
            },
          )
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}

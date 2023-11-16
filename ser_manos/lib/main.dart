import 'dart:async';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/router.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/firebase_options.dart';
import 'package:ser_manos/l10n/localizations.dart';
import 'package:ser_manos/providers/analytics_provider.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    setupLocalization();

    runApp(const ProviderScope(
      child: MyApp(),
    ));
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

// This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    getAnalytics();

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SermanosColors.primary100),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

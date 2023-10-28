import 'package:flutter/material.dart';
import 'package:ser_manos/config/router.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/data/firebase_config.dart';
import 'package:ser_manos/data/repositories/user_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SermanosColors.primary100),
        useMaterial3: true,
      ),
    );
  }

  @override
  void initState() {
    FirebaseConfig.init().then((_) async => {
          // you can add test stuff here, but remove it before committing
        });
    super.initState();
  }
}

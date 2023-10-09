import 'package:flutter/material.dart';
import 'package:ser_manos/config/router.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/firebaseConfig.dart';


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
        colorScheme: ColorScheme.fromSeed(seedColor: SermanosColors.primary),
        useMaterial3: true,
      ),
    );
  }

  @override
  void initState() {
    FirebaseConfig.init().then((_) => {
      // MyFirebaseAuth().createUserWithEmailAndPassword(email: "gdeschant@itba.edu.ar", password: "Cabernicolas10!")
    });
    super.initState();
  }
}

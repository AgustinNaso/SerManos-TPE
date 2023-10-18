import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static var app = null;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      app = await Firebase.initializeApp(options: iosOptions);
      return;
    } catch (e) {
      print(e);
    }
  }

  static const FirebaseOptions iosOptions = FirebaseOptions(
    apiKey: "AIzaSyB5WbDpq0n0qTyPrhho-PbtJ61srrmV450",
    appId: "1:241699172646:ios:2b0b0b0b0b0b0b0b0b0b0b", // TODO put a real one here
    messagingSenderId: "241699172646",
    projectId: "ser-manos-feec3",
  );
}
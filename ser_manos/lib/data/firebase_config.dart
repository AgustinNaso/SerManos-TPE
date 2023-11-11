import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static var app = null;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      app = await Firebase.initializeApp();
      return;
    } catch (e) {
      print(e);
    }
  }
}
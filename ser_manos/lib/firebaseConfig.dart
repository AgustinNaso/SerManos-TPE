import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

class MyFirebaseAuth {
  final _firebaseAuth = FirebaseAuth.instanceFor(app: FirebaseConfig.app);

  currentUser() {
    return _firebaseAuth.currentUser;
  }

  // TODO: create entity and add type to response
  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return (userCredential.user);
    } on Error catch (e) {
      print(e);
    }
  }

  @override // TODO: add type to response
  Future createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(userCredential.user);

      return _firebaseAuth.currentUser;
    } on Error catch (e) {
      print(e);
    }
  }
}
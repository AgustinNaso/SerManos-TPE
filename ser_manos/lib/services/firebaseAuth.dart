import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/firebaseConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userModel.dart';

class MyFirebaseAuth {
  final _firebaseAuth = FirebaseAuth.instanceFor(app: FirebaseConfig.app);

  currentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<SermanosUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = (await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email ).get()).docs.first.data();

      return SermanosUser.fromJson(user);
    } on Error catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<SermanosUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String lastname,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userJson = {
        'email': email,
        'name': name,
        'lastname': lastname
      };

      await FirebaseFirestore.instance.collection('users').add(userJson);

      return SermanosUser.fromJson(userJson);
    } on Error catch (e) {
      print(e);
      rethrow;
    }
  }
}
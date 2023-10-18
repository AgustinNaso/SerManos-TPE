import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/firebase_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/repositories/user_repository_impl.dart';

import '../models/user_model.dart';

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

      return await UserRepositoryImpl().getUserByEmail(email); // TODO: handle possible errors
    } on Error catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<SermanosUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userJson = {
        'id': userCredential.user!.uid,
        'email': email,
        'name': name,
        'lastName': lastName
      };

      final user = await UserRepositoryImpl().create(SermanosUser.fromJson(userJson));

      return user;
    } on Error catch (e) {
      print(e);
      rethrow;
    }
  }
}
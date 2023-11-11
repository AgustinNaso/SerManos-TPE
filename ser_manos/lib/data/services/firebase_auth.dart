import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/user_repository_impl.dart';


class MyFirebaseAuth {
  final _firebaseAuth = FirebaseAuth.instanceFor(app: Firebase.app());

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

      FirebaseAnalytics analytics = FirebaseAnalytics.instance;
      await analytics.logLogin(loginMethod: 'email');

      return await UserRepositoryImpl().getById(userCredential.user!.uid); // TODO: handle possible errors
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

      final user = await UserRepositoryImpl().createUser(SermanosUser.fromJson(userJson));

      return user;
    } on Error catch (e) {
      print(e);
      rethrow;
    }
  }
}
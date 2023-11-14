import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';
import 'package:ser_manos/data/repositories/user_repository_impl.dart';

class MyFirebaseAuth {
  static final _firebaseAuth = FirebaseAuth.instanceFor(app: Firebase.app());
  final Ref ref;

  MyFirebaseAuth({required this.ref});

  static currentUser() {
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

      final user =
          await UserRepositoryImpl().getUsersById(userCredential.user!.uid);

      return user;
    } on Error catch (e) {
      print("signInWithEmailAndPassword $e");
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

      const volunteeringPostulation = VolunteeringPostulation(
          volunteeringId: '',
          status: VolunteeringPostulationStatus.notPostulated);

      final userJson = {
        'id': userCredential.user!.uid,
        'email': email,
        'name': name,
        'lastName': lastName,
        'volunteeringPostulation': volunteeringPostulation.toJson()
      };

      final user = await UserRepositoryImpl()
          .createUser(SermanosUser.fromJson(userJson));

      return user;
    } on Error catch (e) {
      print(e);
      rethrow;
    }
  }
}

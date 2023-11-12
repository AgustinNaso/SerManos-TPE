import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/services/firebase_auth.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
MyFirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return MyFirebaseAuth(ref: ref);
}

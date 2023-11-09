import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/register_form.dart';
import 'package:ser_manos/data/services/firebase_auth.dart';

final registerControllerProvider =
    StateNotifierProvider<RegisterController, String>(
        (ref) => RegisterController(RegisterStates.initial.name));

enum RegisterStates {
  initial,
  loading,
  success,
  error,
}

class RegisterController extends StateNotifier<String> {
  RegisterController(super.state);

  @override
  get state => super.state;

  void reset() {
    state = RegisterStates.initial.name;
  }

  Future<void> register(
    String email,
    String password,
    String name,
    String lastName,
  ) async {
    state = RegisterStates.loading.name;
    try {
      await MyFirebaseAuth().createUserWithEmailAndPassword(
        email: email,
        password: password,
        lastName: lastName,
        name: name,
      );

      state = RegisterStates.success.name;
    } catch (e) {
      state = RegisterStates.error.name;
      RegisterFormKey.currentState!.validate();
    }
  }
}

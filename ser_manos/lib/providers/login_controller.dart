import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/login_form.dart';
import 'package:ser_manos/data/services/firebase_auth.dart';

final loginControllerProvider = StateNotifierProvider<LoginController, String>(
    (ref) => LoginController(LoginStates.initial.name));

enum LoginStates {
  initial,
  loading,
  success,
  error,
}

class LoginController extends StateNotifier<String> {
  LoginController(super.state);

  @override
  get state => super.state;

  void reset() {
    state = LoginStates.initial.name;
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    state = LoginStates.loading.name;
    try {
      await MyFirebaseAuth()
          .signInWithEmailAndPassword(email: email, password: password);

      state = LoginStates.success.name;
    } catch (e) {
      state = LoginStates.error.name;
      LoginFormKey.currentState!.validate();
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/login_form.dart';
import 'package:ser_manos/data/models/form_states.dart';
import 'package:ser_manos/data/services/firebase_auth.dart';

final loginControllerProvider = StateNotifierProvider<LoginController, String>(
    (ref) => LoginController(FormStates.initial.name));

class LoginController extends StateNotifier<String> {
  LoginController(super.state);

  @override
  get state => super.state;

  void reset() {
    state = FormStates.initial.name;
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    state = FormStates.loading.name;
    try {
      await MyFirebaseAuth()
          .signInWithEmailAndPassword(email: email, password: password);

      state = FormStates.success.name;
    } catch (e) {
      state = FormStates.error.name;
      LoginFormKey.currentState!.validate();
    }
  }
}

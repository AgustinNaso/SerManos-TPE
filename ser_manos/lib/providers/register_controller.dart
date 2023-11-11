import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/register_form.dart';
import 'package:ser_manos/data/models/form_states.dart';
import 'package:ser_manos/data/services/firebase_auth.dart';

final registerControllerProvider =
    StateNotifierProvider<RegisterController, String>(
        (ref) => RegisterController(FormStates.initial.name));

class RegisterController extends StateNotifier<String> {
  RegisterController(super.state);

  @override
  get state => super.state;

  void reset() {
    state = FormStates.initial.name;
  }

  Future<void> register(
    String email,
    String password,
    String name,
    String lastName,
  ) async {
    state = FormStates.loading.name;
    try {
      await MyFirebaseAuth().createUserWithEmailAndPassword(
        email: email,
        password: password,
        lastName: lastName,
        name: name,
      );

      state = FormStates.success.name;
    } catch (e) {
      state = FormStates.error.name;
      RegisterFormKey.currentState!.validate();
    }
  }
}

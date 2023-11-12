import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/config/cellules/register_form.dart';
import 'package:ser_manos/data/models/form_states.dart';

import 'auth_provider.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  build() => {};

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
      final auth = ref.read(firebaseAuthProvider);
      await auth.createUserWithEmailAndPassword(
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

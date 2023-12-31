import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/config/cellules/login_form.dart';
import 'package:ser_manos/data/models/form_states.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'auth_provider.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  build() => {};

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
      final auth = ref.read(firebaseAuthProvider);
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      state = FormStates.success.name;
      ref.read(loggedUserProvider.notifier).set(user);
    } catch (e) {
      state = FormStates.error.name;
      LoginFormKey.currentState!.validate();
    }
  }
}

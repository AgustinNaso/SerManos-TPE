import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginValidatorProvider =
    StateNotifierProvider<LoginValidator, bool>((ref) => LoginValidator(false));

class LoginValidator extends StateNotifier<bool> {
  LoginValidator(super.state);

  final Map<String, bool> _fields = {
    'email': false,
    'password': false,
  };

  void loading() {
    state = false;
  }

  void set(String field, bool value) {
    _fields[field] = value;
    state = _fields.values.every((element) => element);
  }
}

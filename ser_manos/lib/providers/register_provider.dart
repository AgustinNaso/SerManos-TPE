import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerValidatorProvider =
    StateNotifierProvider<RegisterValidator, bool>(
        (ref) => RegisterValidator(false));

class RegisterValidator extends StateNotifier<bool> {
  RegisterValidator(super.state);

  final Map<String, bool> _fields = {
    'name': false,
    'lastName': false,
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

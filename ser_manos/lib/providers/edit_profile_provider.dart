import 'package:flutter_riverpod/flutter_riverpod.dart';

final editProfileValidatorProvider =
StateNotifierProvider<EditProfileValidator, bool>((ref) => EditProfileValidator(true));

class EditProfileValidator extends StateNotifier<bool> {
  EditProfileValidator(super.state);

  void loading() {
    state = false;
  }

  void reset() {
    state = true;
  }

  void error() {
    state = true;
    // TODO: handle posible errors
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadImageProvider =
StateNotifierProvider<UploadImageValidator, bool>((ref) => UploadImageValidator(true));

class UploadImageValidator extends StateNotifier<bool> {
  UploadImageValidator(super.state);

  void loading() {
    state = false;
  }

  void loadingDone() {
    state = true;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/form_states.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:ser_manos/data/services/storage_service.dart';
import 'package:ser_manos/providers/repository_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'package:ser_manos/screens/edit_profile.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  @override
  build() => {};

  @override
  get state => super.state;

  void reset() {
    state = FormStates.initial.name;
  }

  Future<void> editProfile(String uid, String? filePath, String? contactEmail,
      DateTime? birthDate, String? phoneNumber, Gender? gender) async {
    state = FormStates.loading.name;
    try {
      String imgUrl = "";
      if (filePath != null && !filePath.contains("http")) {
        imgUrl = await StorageService.uploadProfilePicture(uid, filePath);
      }

      final newFields = {
        'profileImgUrl': imgUrl,
        'contactEmail': contactEmail,
        'birthDate': birthDate,
        'phoneNumber': phoneNumber,
        'gender': gender
      };

      await ref.read(userRepositoryProvider).updateUser(uid, newFields);
      ref.read(loggedUserProvider.notifier).updateUser(newFields);
      state = FormStates.success.name;
    } catch (e) {
      state = FormStates.error.name;
      EditProfileFormKey.currentState!.validate();
    }
  }
}

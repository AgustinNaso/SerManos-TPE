import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/data/models/form_states.dart';
import 'package:ser_manos/l10n/localizations.dart';
import 'package:ser_manos/providers/edit_profile_controller.dart';
import 'package:ser_manos/providers/edit_profile_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'package:ser_manos/screens/edit_profile.dart';

class EditProfileButton extends ConsumerWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool enabled = ref.watch(editProfileValidatorProvider);
    _attendEditProfileProvider(context, ref);

    return SermanosCtaButton(
        text: AppLocalizations.of(context)!.saveData,
        enabled: enabled,
        onPressed: () {
          _onPressed(context, ref);
        });
  }

  _attendEditProfileProvider(BuildContext context, WidgetRef ref) {
    final editProfileStateProvider = ref.watch(editProfileControllerProvider);

    if (editProfileStateProvider == FormStates.success.name) {
      Future(() {
        if (GoRouter.of(context).canPop()) GoRouter.of(context).pop();
        ref.read(editProfileValidatorProvider.notifier).reset();
      });
    }
    if (editProfileStateProvider == FormStates.loading.name) {
      Future(() => ref.read(editProfileValidatorProvider.notifier).loading());
    }
  }

  _onPressed(BuildContext context, WidgetRef ref) {
    final uid = ref.read(loggedUserProvider)!.id;
    final filePath =
        EditProfileFormKey.currentState?.fields['profileImgUrl']?.value;
    final contactEmail =
        EditProfileFormKey.currentState!.fields['contactEmail']?.value;
    final birthDate =
        EditProfileFormKey.currentState!.fields['birthDate']?.value;
    final phoneNumber =
        EditProfileFormKey.currentState!.fields['phoneNumber']?.value;
    final gender = genderNameToGender(
        context, EditProfileFormKey.currentState?.fields['gender']?.value);
    ref.read(editProfileControllerProvider.notifier).editProfile(
        uid, filePath, contactEmail, birthDate, phoneNumber, gender);
  }
}

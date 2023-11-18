import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
    bool loading =
        ref.watch(editProfileControllerProvider) == FormStates.loading.name;
    return SermanosCtaButton(
        text: AppLocalizations.of(context)!.saveData,
        enabled: enabled,
        loading: loading,
        onPressed: () {
          _onPressed(context, ref);
        });
  }

  _onPressed(BuildContext context, WidgetRef ref) async {
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

    final locale = Localizations.localeOf(context).languageCode;

    ref.read(editProfileValidatorProvider.notifier).loading();

    await ref.read(editProfileControllerProvider.notifier).editProfile(
        uid,
        filePath,
        contactEmail,
        DateFormat.yMd(locale).parse(birthDate),
        phoneNumber,
        gender);
    if (context.mounted) {
      GoRouter.of(context).pop(true);
    }
  }
}

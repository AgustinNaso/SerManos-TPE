import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/cellules/edit_profile_data_form.dart';
import 'package:ser_manos/config/cellules/profile_contact_form.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/providers/repository_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';

final EditProfileFormKey = GlobalKey<FormBuilderState>();

class EditProfileScreen extends ConsumerWidget {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedUserProvider);
    final userRepository = ref.watch(userRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SermanosColors.neutral0,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon:
              SermanosIcons.close(status: SermanosIconStatus.enabledSecondary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: FormBuilder(
          key: EditProfileFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditProfileDataForm(
                  user: user!,
                  genderField: user.gender,
                  birthdateField: user.birthDate ?? DateTime.now(),
                  profileImgUrl: user.profileImgUrl),
              const SizedBox(
                height: 32,
              ),
              Text(
                AppLocalizations.of(context)!.profileData,
                style: const SermanosTypography.headline01(
                  color: SermanosColors.neutral100,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.shareDisclaimer,
                style: const SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ContactForm(
                user: user,
                phoneNumber: user.phoneNumber ?? "",
                email: user.email,
              ),
              const SizedBox(
                height: 32,
              ),
              SermanosCtaButton(
                text: AppLocalizations.of(context)!.saveData,
                onPressed: () => {
                  EditProfileFormKey.currentState!.saveAndValidate(),
                  userRepository.updateUser(
                      user, EditProfileFormKey.currentState!.value),
                  GoRouter.of(context).pop(true)

                  // print(EditProfileFormKey.currentState!.fields['profileImgUrl']!.value),
                  // print(EditProfileFormKey.currentState!.fields['birthdate']!.value),
                  // print(EditProfileFormKey
                  //     .currentState!.fields['birthdate']!.value),
                  // print(ContactFormKey.currentState!.fields),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

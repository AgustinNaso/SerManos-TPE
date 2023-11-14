import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/cellules/edit_profile_data_form.dart';
import 'package:ser_manos/config/cellules/profile_contact_form.dart';
import 'package:ser_manos/config/molecules/buttons/edit_profile_button.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/providers/user_provider.dart';

final EditProfileFormKey = GlobalKey<FormBuilderState>();

class EditProfileScreen extends ConsumerWidget {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedUserProvider);
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
                  birthDateField: user.birthDate ?? DateTime.now(),
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
                phoneNumber: user.phoneNumber,
                contactEmail: user.contactEmail,
              ),
              const SizedBox(
                height: 32,
              ),
              const EditProfileButton(),
            ],
          ),
        ),
      ),
    );
  }
}

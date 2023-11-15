import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/molecules/inputs/sermanos_date_field.dart';
import 'package:ser_manos/config/molecules/inputs/sermanos_gender_selection.dart';
import 'package:ser_manos/config/molecules/inputs/sermanos_upload_profile_photo.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class EditProfileDataForm extends ConsumerWidget {
  final Gender? genderField;
  final DateTime? birthDateField;
  final String? profileImgUrl;

  const EditProfileDataForm({
    Key? key,
    required this.birthDateField,
    this.genderField,
    this.profileImgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onChangeFocus(field, value) {
      // ref.read(registerValidatorProvider.notifier).set(field, value); //TODO: PROVIDER
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.profileData,
          style: const SermanosTypography.headline01(
            color: SermanosColors.neutral100,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SermanosDateField(
          label: AppLocalizations.of(context)!.dateOfBirth,
          initialValue: birthDateField,
          name: "birthDate",
          icon: SermanosIcons.calendar(status: SermanosIconStatus.activated),
          onChangeFocus: onChangeFocus,
          validators: [
            FormBuilderValidators.required(
                errorText: AppLocalizations.of(context)!.requiredFieldError),
            FormBuilderValidators.dateString(
              errorText: AppLocalizations.of(context)!.wrongBirthDate,
            ),
            (value) {
              if (value != null) {
                final date = DateFormat('yyyy-MM-dd').parse(value);
                if (date.isAfter(DateTime.now())) {
                  return AppLocalizations.of(context)!.wrongBirthDate;
                }
              }
            }
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
                color: SermanosColors.secondary25,
              ),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context)!.personalInfo,
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral100),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4)),
                  color: SermanosColors.neutral10,
                ),
                width: double.infinity,
                child: SermanosGenderSelection(initialValue: genderField)),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        SermanosUploadProfilePhoto(
          initialValue: profileImgUrl,
          enabled: true,
        )
      ],
    );
  }
}

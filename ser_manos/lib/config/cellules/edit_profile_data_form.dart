import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/molecules/userInputs/sermanos_date_field.dart';
import 'package:ser_manos/config/molecules/userInputs/sermanos_gender_selection.dart';
import 'package:ser_manos/config/molecules/userInputs/sermanos_upload_profile_photo.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditProfileDataForm extends ConsumerWidget {
  final SermanosUser user;
  final Gender genderField;
  final DateTime birthdateField;
  final String imageField;

  const EditProfileDataForm({
    Key? key,
    required this.user,
    required this.genderField,
    required this.birthdateField,
    required this.imageField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // key: EditProfileDataKey,
      // enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos de perfil",
            style: SermanosTypography.headline01(
              color: SermanosColors.neutral100,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SermanosDateField(
              label: "Fecha de nacimiento",
              icon: SermanosIcons.calendar(
                  status: SermanosIconStatus
                      .activated)), //TODO: internacionalizacion
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
                child: const Text(
                  "Información del perfil", //TODO: internacionalizacion
                  style: SermanosTypography.subtitle01(
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
            formField: imageField,
            initialValue: user.profileImgUrl,
            enabled: true,
          )
        ],
      ),
    );
  }
}

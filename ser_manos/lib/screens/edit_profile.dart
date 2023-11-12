
import 'package:flutter/material.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/cellules/edit_profile_data_form.dart';
import 'package:ser_manos/config/cellules/profile_contact_form.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:ser_manos/data/models/user_model.dart';


final EditProfileFormKey = GlobalKey<FormBuilderState>();

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final SermanosUser user = SermanosUser(
        id: "1",
        email: "gdeschant@itba.edu.ar",
        name: "gaston",
        lastName: "De Schant",
        birthDate: DateTime.now(),
        phoneNumber: "123456789",
        gender: Gender.noBinary,
        profileImgUrl: "https://imgv3.fotor.com/images/cover-photo-image/a-beautiful-girl-with-gray-hair-and-lucxy-neckless-generated-by-Fotor-AI.jpg",
        contactEmail: "nomecontacten@gmail.com"
    );// ref
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SermanosColors.neutral0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(false),
          icon:
              SermanosIcons.close(status: SermanosIconStatus.enabledSecondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 32,
        ),
        child: FormBuilder(
          key: EditProfileFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditProfileDataForm(
                  user: user,
                  genderField: user.gender ?? Gender.noBinary,
                  birthdateField: user.birthDate ?? DateTime.now(),
                  profileImgUrl: user.profileImgUrl
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Datos de perfil",    //TODO: internacionalizacion
                  style: SermanosTypography.headline01(
                    color: SermanosColors.neutral100,
                  ),
                ),
                const Text(
                  "Estos datos serán compartidos con la organización para ponerse en contacto contigo", //TODO: internacionalizacion
                  style: SermanosTypography.subtitle01(
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
                    text: "save",
                    onPressed: () => {
                      // print(EditProfileFormKey.currentState!.fields['profileImgUrl']!.value),
                      // print(EditProfileFormKey.currentState!.fields['birthdate']!.value),
                      print(EditProfileFormKey.currentState!.fields['birthdate']!.value),
                      // print(ContactFormKey.currentState!.fields),

                      },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


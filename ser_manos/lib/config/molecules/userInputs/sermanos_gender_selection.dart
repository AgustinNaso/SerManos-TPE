import 'package:flutter/material.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class SermanosGenderSelection extends StatelessWidget {
  final Gender initialValue;

  const SermanosGenderSelection({Key? key, required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderRadioGroup(
      orientation: OptionsOrientation.vertical,
      initialValue: initialValue.text,
      name: 'gender',
      validator:
                FormBuilderValidators.required(
                    errorText:
                        AppLocalizations.of(context)!.requiredFieldError),

      
      options: [
        FormBuilderFieldOption(value: Gender.male.text,),
        FormBuilderFieldOption(value: Gender.female.text),
        FormBuilderFieldOption(value: Gender.noBinary.text),
      ]       
    );
  }
}

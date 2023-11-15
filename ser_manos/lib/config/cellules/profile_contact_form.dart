import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/config/molecules/inputs/sermanos_text_field.dart';
import 'package:ser_manos/providers/login_provider.dart';

class ContactForm extends ConsumerWidget {
  final String? phoneNumber;
  final String? contactEmail;

  const ContactForm({
    Key? key,
    required this.phoneNumber,
    required this.contactEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onChangeFocus(field, value) {
      ref.read(loginValidatorProvider.notifier).set(field, value);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SermanosTextField(
            labelText: AppLocalizations.of(context)!.phonenumber,
            hintText: AppLocalizations.of(context)!.phoneNumberHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            onChangeFocus: onChangeFocus,
            initialValue: phoneNumber ?? "",
            name: "phoneNumber",
            validators: [
              FormBuilderValidators.required(
                  errorText: AppLocalizations.of(context)!.requiredFieldError),
              FormBuilderValidators.numeric(
                  errorText: AppLocalizations.of(context)!.phonenumberError),
              FormBuilderValidators.minLength(10,
                  errorText: AppLocalizations.of(context)!.phonenumberError),
              FormBuilderValidators.maxLength(15,
                  errorText: AppLocalizations.of(context)!.phonenumberError),
              (val) {
                return null;
              },
            ]),
        const SizedBox(height: 24),
        SermanosTextField(
          onChangeFocus: onChangeFocus,
          labelText: AppLocalizations.of(context)!.mail,
          hintText: AppLocalizations.of(context)!.contactMailHint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          name: "contactEmail",
          initialValue: contactEmail ?? "",
          validators: [
            FormBuilderValidators.required(
                errorText: AppLocalizations.of(context)!.requiredFieldError),
            FormBuilderValidators.email(
                errorText: AppLocalizations.of(context)!.enterValidEmailError),
          ],
        ),
      ],
    );
  }
}

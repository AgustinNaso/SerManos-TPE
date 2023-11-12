import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/config/molecules/inputs/sermanos_text_field.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/providers/login_provider.dart';


class ContactForm extends ConsumerWidget {
  final SermanosUser user;
  final String phoneNumber;
  final String email;
  const ContactForm({
    Key? key,
    required this.user,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    onChangeFocus  (field, value) {
      ref.read(loginValidatorProvider.notifier).set(field, value);
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SermanosTextField(

            onChangeFocus: onChangeFocus,
            labelText: AppLocalizations.of(context)!.mail,
            name: "email",
            initialValue: user.email,
            validators: [
              FormBuilderValidators.required(
                  errorText:
                      AppLocalizations.of(context)!.requiredFieldError),
              FormBuilderValidators.email(
                  errorText:
                      AppLocalizations.of(context)!.enterValidEmailError),
            ],
          ),
          const SizedBox(height: 24),
          SermanosTextField(
              labelText: AppLocalizations.of(context)!.phonenumber,
              onChangeFocus: onChangeFocus,
              initialValue: phoneNumber,
              name: "phoneNumber",
              validators: [
                FormBuilderValidators.required(
                    errorText:
                        AppLocalizations.of(context)!.requiredFieldError),
                FormBuilderValidators.numeric(
                    errorText:
                        AppLocalizations.of(context)!.phonenumberError),
                FormBuilderValidators.minLength(10, 
                    errorText:
                        AppLocalizations.of(context)!.phonenumberError),
                FormBuilderValidators.maxLength(15,
                    errorText:
                        AppLocalizations.of(context)!.phonenumberError),
                (val) {
                  return null;
                },
              ]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
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
            labelText: 'email',
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
              labelText: 'phoneNumber',
              onChangeFocus: onChangeFocus,
              initialValue: phoneNumber,
              name: "phoneNumber",
              validators: [
                FormBuilderValidators.required(
                    errorText:
                        AppLocalizations.of(context)!.requiredFieldError),
                FormBuilderValidators.minLength(8,
                    errorText:
                        AppLocalizations.of(context)!.minLengthError(8)),
                (val) {
                  return null;
                },
              ]),
        ],
      ),
    );
  }
}

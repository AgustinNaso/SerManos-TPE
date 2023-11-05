import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

final RegisterFormKey = GlobalKey<FormBuilderState>();

class RegisterForm extends ConsumerWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: RegisterFormKey,
      enabled: true,
      child: Column(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              // Set horizontal margin
              child: SermanosTextField(
                  hintText: AppLocalizations.of(context)!.name,
                  labelText: AppLocalizations.of(context)!.name,
                  name: "name",
                  validators: [
                    FormBuilderValidators.required(
                        errorText:
                            AppLocalizations.of(context)!.requiredFieldError),
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              // Set horizontal margin
              child: SermanosTextField(
                  hintText: AppLocalizations.of(context)!.lastName,
                  labelText: AppLocalizations.of(context)!.lastName,
                  name: "lastName",
                  validators: [
                    FormBuilderValidators.required(
                        errorText:
                            AppLocalizations.of(context)!.requiredFieldError),
// Validators().maxLength(20) //TODO: Fix maxLength
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
// Set horizontal margin
              child: SermanosTextField(
                  hintText: AppLocalizations.of(context)!.email,
                  labelText: AppLocalizations.of(context)!.email,
                  name: "email",
                  validators: [
                    FormBuilderValidators.required(
                        errorText:
                            AppLocalizations.of(context)!.requiredFieldError),
                    FormBuilderValidators.email(
                        errorText:
                            AppLocalizations.of(context)!.enterValidEmailError),
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
// Set horizontal margin
              child: SermanosTextField(
                  hintText: AppLocalizations.of(context)!.password,
                  labelText: AppLocalizations.of(context)!.password,
                  name: "password",
                  enableObscure: true,
                  validators: [
                    FormBuilderValidators.required(
                        errorText:
                            AppLocalizations.of(context)!.requiredFieldError),
                    FormBuilderValidators.minLength(8,
                        errorText:
                            AppLocalizations.of(context)!.minLengthError(8)),
                  ]),
            ),
          ]),
        ],
      ),
    );
  }
}

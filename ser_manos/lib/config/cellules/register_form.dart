import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/providers/register_controller.dart';
import 'package:ser_manos/providers/register_provider.dart';

final RegisterFormKey = GlobalKey<FormBuilderState>();

class RegisterForm extends ConsumerWidget {
  static bool alreadyInUseError = false;

  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProvider = ref.watch(registerControllerProvider.notifier);

    onChangeFocus(field, value) {
      ref.read(registerValidatorProvider.notifier).set(field, value);
    }

    return FormBuilder(
      key: RegisterFormKey,
      enabled: true,
      child: Column(
        children: <Widget>[
          Column(children: <Widget>[
            SermanosTextField(
                onChangeFocus: onChangeFocus,
                hintText: AppLocalizations.of(context)!.nameHint,
                labelText: AppLocalizations.of(context)!.name,
                name: "name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validators: [
                  FormBuilderValidators.required(
                      errorText:
                          AppLocalizations.of(context)!.requiredFieldError),
                ]),
            const SizedBox(height: 24),
            SermanosTextField(
                onChangeFocus: onChangeFocus,
                hintText: AppLocalizations.of(context)!.lastNameHint,
                labelText: AppLocalizations.of(context)!.lastName,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                name: "lastName",
                validators: [
                  FormBuilderValidators.required(
                      errorText:
                          AppLocalizations.of(context)!.requiredFieldError),
// Validators().maxLength(20) //TODO: Fix maxLength
                ]),
            const SizedBox(height: 24),
            SermanosTextField(
                onChangeFocus: onChangeFocus,
                hintText: AppLocalizations.of(context)!.emailHint,
                labelText: AppLocalizations.of(context)!.email,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                name: "email",
                onChanged: (value) {
                  if (registerProvider.state == RegisterStates.error.name) {
                    registerProvider.reset();
                  }
                },
                validators: [
                  FormBuilderValidators.required(
                      errorText:
                          AppLocalizations.of(context)!.requiredFieldError),
                  FormBuilderValidators.email(
                      errorText:
                          AppLocalizations.of(context)!.enterValidEmailError),
                  (val) {
                    if (registerProvider.state == RegisterStates.error.name) {
                      return "Email already in use";
                    }
                    return null;
                  },
                ]),
            const SizedBox(height: 24),
            SermanosTextField(
                onChangeFocus: onChangeFocus,
                hintText: AppLocalizations.of(context)!.passwordHint,
                labelText: AppLocalizations.of(context)!.password,
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
          ]),
        ],
      ),
    );
  }
}

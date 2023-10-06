import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
                  hintText: 'Nombre',
                  labelText: 'Nombre',
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'This field is required'),
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
// Set horizontal margin
              child: SermanosTextField(
                  hintText: 'Apellido',
                  labelText: 'Apellido',
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'This field is required'),
// Validators().maxLength(20) //TODO: Fix maxLength
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
// Set horizontal margin
              child: SermanosTextField(
                  hintText: 'Email',
                  labelText: 'Email',
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'This field is required'),
                    FormBuilderValidators.email(
                        errorText: 'Enter a valid email address'),
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
// Set horizontal margin
              child: SermanosTextField(
                  hintText: 'Password',
                  labelText: 'Password',
                  enableObscure: true,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'This field is required'),
                    FormBuilderValidators.minLength(8,
                        errorText:
                            'This field must be at least 8 characters long'),
                  ]),
            ),
          ]),
        ],
      ),
    );
  }
}

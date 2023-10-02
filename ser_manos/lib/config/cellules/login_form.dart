import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/molecules/textfields/sermanos_text_field.dart';
import 'package:ser_manos/config/molecules/textfields/validators.dart';

final LoginFormKey = GlobalKey<FormBuilderState>();

class LoginForm extends ConsumerWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: LoginFormKey,
      enabled: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                // Set horizontal margin
                child: SermanosTextField(
                  hintText: 'Email',
                  labelText: 'Email',
                  validators: [Validators.nonEmpty(), Validators.email()],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                // Set horizontal margin
                child: SermanosTextField(
                    hintText: 'Password',
                    labelText: 'Password',
                    enableObscure: true,
                    validators: [Validators.nonEmpty(), Validators.minLength(8)]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
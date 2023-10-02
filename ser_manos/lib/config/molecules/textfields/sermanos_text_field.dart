import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosTextField extends HookConsumerWidget {
  final String hintText;
  final String labelText;
  final bool enableObscure;
  final List<String? Function(String?)>? validators;

  const SermanosTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.enableObscure = false,
      this.validators = const []});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFocusNode = useState(FocusNode());
    useListenable(myFocusNode);

    final controller = useTextEditingController();

    final bool isEmpty =
      useListenableSelector(controller, () => controller.text.isEmpty);

    final isObscured = useState(enableObscure);

    return FormBuilderField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: labelText,
      onReset: () => controller.text = '',
      validator: (value) {
        if (myFocusNode.value.hasFocus) {
          return null;
        }
        if (validators != null) {
          for (final validator in validators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        return null;
      },
      builder: (FormFieldState field) {
        return TextField(
          focusNode: myFocusNode.value,
          controller: controller,
          obscureText: isObscured.value,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            // error handling
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SermanosColors.red),
            ),
            floatingLabelStyle: TextStyle(
                color: myFocusNode.value.hasFocus ? SermanosColors.secondary : SermanosColors.grey),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SermanosColors.secondary),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SermanosColors.grey),
            ),
            suffixIcon: enableObscure
                ? IconButton(
              icon: Icon(
                isObscured.value ? Icons.visibility : Icons.visibility_off,
                color: SermanosColors.grey,
              ),
              onPressed: () {
                isObscured.value = !isObscured.value;
              },
            )
                : controller.text.isNotEmpty && myFocusNode.value.hasFocus
                ? IconButton(
              icon: const Icon(Icons.clear, color: SermanosColors.grey),
              onPressed: () {
                if (!isEmpty) {
                  controller.clear();
                  field.reset();
                }
              },
            )
                : null,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosTextField extends HookConsumerWidget {
  final String hintText;
  final String labelText;
  final String name;
  final bool enableObscure;
  final List<String? Function(String?)>? validators;
  final void Function(String?)? onChanged;

  const SermanosTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.name,
      this.enableObscure = false,
      this.validators,
        this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFocusNode = useFocusNode();
    useListenable(myFocusNode);

    final controller = useTextEditingController();

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    final isObscured = useState(enableObscure);

    return FormBuilderField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      onChanged: onChanged,
      onReset: () => controller.text = '',
      validator: (value) {
        if (myFocusNode.hasFocus) {
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
          focusNode: myFocusNode,
          controller: controller,
          onChanged: (value) => field.didChange(value),
          obscureText: isObscured.value,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            // error handling
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: SermanosColors.error100,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorStyle: const TextStyle(
              color: SermanosColors.error100,
            ),
            errorMaxLines: 3,
            errorText: field.errorText,
            floatingLabelStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? SermanosColors.secondary200
                    : SermanosColors.neutral75),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SermanosColors.secondary200),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SermanosColors.neutral200),
            ),
            suffixIcon: enableObscure
                ? IconButton(
                    icon: Icon(
                      isObscured.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: SermanosColors.neutral75,
                    ),
                    onPressed: () {
                      isObscured.value = !isObscured.value;
                    },
                  )
                : controller.text.isNotEmpty && myFocusNode.hasFocus
                    ? IconButton(
                        icon:
                            Icon(Icons.clear, color: SermanosColors.neutral75),
                        onPressed: () {
                          if (!isEmpty) {
                            controller.clear();
                            field.reset();
                          }
                        },
                      )
                    : null,
          ),
          onTapOutside: (event) {
            myFocusNode.unfocus();
          },
          onEditingComplete: () {
            myFocusNode.unfocus();
          },
          onSubmitted: (value) {
            myFocusNode.unfocus();
          },
        );
      },
    );
  }
}

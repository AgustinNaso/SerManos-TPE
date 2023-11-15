import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

class SermanosTextField extends HookConsumerWidget {
  final String? hintText;
  final String labelText;
  final String name;
  final bool enableObscure;
  final List<String? Function(String?)>? validators;
  final void Function(String?)? onChanged;
  final void Function(String, bool)? onChangeFocus;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String initialValue;
  final Icon? icon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType textInputType;

  const SermanosTextField({
    super.key,
    required this.labelText,
    required this.name,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.icon,
    this.hintText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.enableObscure = false,
    this.validators,
    this.onChanged,
    this.onChangeFocus,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFocusNode = useFocusNode();
    useListenable(myFocusNode);

    final controller = useTextEditingController.fromValue(TextEditingValue(
      text: initialValue,
      selection: TextSelection.collapsed(offset: initialValue.length),
    ));
    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    final isObscured = useState(enableObscure);

    return FormBuilderField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      onChanged: onChanged,
      initialValue: initialValue,
      onReset: () => controller.text = '',
      validator: (value) {
        if (validators != null) {
          for (final validator in validators!) {
            final error = validator(value);
            if (error != null) {
              Future(() {
                onChangeFocus?.call(name, false);
              });
              return myFocusNode.hasFocus ? null : error;
            }
          }
          Future(() {
            onChangeFocus?.call(name, true);
          });
        }
        return null;
      },
      builder: (FormFieldState field) {
        return TextField(
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          focusNode: myFocusNode,
          controller: controller,
          onChanged: (value) => field.didChange(value),
          obscureText: isObscured.value,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            floatingLabelBehavior: floatingLabelBehavior,
            hintStyle: const SermanosTypography.subtitle01(
              color: SermanosColors.neutral50,
            ),
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
            floatingLabelStyle: SermanosTypography.subtitle01(
                color: myFocusNode.hasFocus
                    ? SermanosColors.secondary200
                    : SermanosColors.neutral75),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: SermanosColors.secondary200),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SermanosColors.neutral75),
            ),
            suffixIcon: icon ??
                (enableObscure
                    ? IconButton(
                        icon: isObscured.value
                            ? SermanosIcons.visibilityOff(
                                status: SermanosIconStatus.enabledSecondary)
                            : SermanosIcons.visibility(
                                status: SermanosIconStatus.enabledSecondary),
                        onPressed: () {
                          isObscured.value = !isObscured.value;
                        },
                      )
                    : controller.text.isNotEmpty && myFocusNode.hasFocus
                        ? IconButton(
                            icon: SermanosIcons.close(
                                status: SermanosIconStatus.activated),
                            onPressed: () {
                              if (!isEmpty) {
                                controller.clear();
                                field.reset();
                              }
                            },
                          )
                        : null),
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

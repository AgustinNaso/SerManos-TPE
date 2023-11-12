import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class SermanosDateField extends HookConsumerWidget {
  final String label;
  final SermanosIcons icon;
  final DateTime initialValue;
  final List<String? Function(String?)>? validators;
  final void Function(String, bool)? onChangeFocus;
  final String name;

  const SermanosDateField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.initialValue,
      required this.name,
      this.onChangeFocus,
      this.validators})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFocusNode = useFocusNode();
    useListenable(myFocusNode);
    String locale = Localizations.localeOf(context).languageCode;

    return FormBuilderDateTimePicker(
      name: name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      format: DateFormat.yMd(locale),
      validator: (value) {
        if (validators != null) {
          for (final validator in validators!) {
            final error = validator(value.toString());
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
      inputType: InputType.date,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: SermanosTypography.subtitle01(
            color: myFocusNode.hasFocus
                ? SermanosColors.secondary200
                : SermanosColors.neutral75),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: SermanosTypography.subtitle01(
            color: myFocusNode.hasFocus
                ? SermanosColors.secondary200
                : SermanosColors.neutral75),
        suffixIcon:
            SermanosIcons.calendar(status: SermanosIconStatus.activated),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SermanosColors.neutral75),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: SermanosColors.secondary200),
        ),
        // border: InputBorder.none,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}

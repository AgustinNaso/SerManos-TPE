import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SermanosDateField extends HookConsumerWidget {
  final String label;
  final SermanosIcons icon;
  final DateTime initialValue;
  final List<String? Function(String?)>? validators;
  final void Function(String, bool)? onChangeFocus;
  final String name;

  const SermanosDateField({Key? key, 
  required this.label,
  required this.icon,
  required this.initialValue,
  required this.name,
  this.onChangeFocus,
  
  this.validators
  })
      : super(key: key);

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final myFocusNode = useFocusNode();
    useListenable(myFocusNode);
    return FormBuilderField(
        name: 'birthdate',
        builder: (FormFieldState field) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: initialValue,
                    validator: (value) {
                      if (validators != null) {
                        for (final validator in validators!) {
                          final error = validator(value.toString());
                          if (error != null) {
                            Future(() {onChangeFocus?.call(name, false);});
                            return myFocusNode.hasFocus ? null : error;
                          }
                        }
                        Future(() {onChangeFocus?.call(name, true);});
                      }
                      return null;
                    },
                    onReset: () => field.didChange(null),
                    inputType: InputType.date,
                    decoration: InputDecoration(
                      labelText: label,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: SermanosIcons.calendar(
                      status: SermanosIconStatus.activated),
                )
              ],
            ),
          );
        });
  }
}

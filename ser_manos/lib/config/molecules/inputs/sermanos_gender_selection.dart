import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/config/molecules/inputs/input_utils.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/l10n/localizations.dart';

class SermanosGenderSelection extends HookConsumerWidget {
  final Gender? initialValue;
  final List<String? Function(String?)>? validators;
  final void Function(String, bool)? onChangeFocus;
  final name = 'gender';

  const SermanosGenderSelection({
    Key? key,
    this.initialValue,
    this.validators,
    this.onChangeFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFocusNode = useFocusNode();
    useListenable(myFocusNode);

    inputValidator(genderNameFromEnum(context, initialValue), validators, name, myFocusNode, onChangeFocus);

    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: SermanosColors.primary100,
        disabledColor: SermanosColors.neutral75,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(SermanosColors.primary100),
          overlayColor: MaterialStateProperty.all(SermanosColors.primary100),
          visualDensity: const VisualDensity(vertical: -4.0),
        ),
      ),
      child: FormBuilderRadioGroup(
        orientation: OptionsOrientation.vertical,
        initialValue: genderNameFromEnum(context, initialValue),
        name: name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
        options: [
          FormBuilderFieldOption(value: AppLocalizations.of(context)!.male),
          FormBuilderFieldOption(value: AppLocalizations.of(context)!.female),
          FormBuilderFieldOption(value: AppLocalizations.of(context)!.nonBinary)
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          isCollapsed: true,
        ),
      ),
    );
  }
}

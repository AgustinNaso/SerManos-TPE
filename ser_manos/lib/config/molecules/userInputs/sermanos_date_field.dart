import 'package:flutter/material.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class SermanosDateField extends StatelessWidget {
  final String label;
  final SermanosIcons icon;

  const SermanosDateField({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              name: 'birthdate',
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
            child: SermanosIcons.calendar(status: SermanosIconStatus.activated),
          )
         
        ],
        ),
       );
        }

    );
    
  }
}
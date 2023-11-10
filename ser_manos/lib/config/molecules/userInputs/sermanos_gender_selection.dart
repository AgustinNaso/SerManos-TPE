import 'package:flutter/material.dart';
import 'package:ser_manos/data/models/gender.dart';

class SermanosGenderSelection extends StatefulWidget {
  final Gender initialValue;

  const SermanosGenderSelection({Key? key, required this.initialValue}) : super(key: key);

  @override
  _SermanosGenderSelectionState createState() => _SermanosGenderSelectionState();
}

class _SermanosGenderSelectionState extends State<SermanosGenderSelection> {
  late Gender _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                  },
                ),
                Text('Male'),
              ]),
            Row(
              children: [
                  Radio<Gender>(
                    value: Gender.female,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                    },
                  ),
                  Text('Female'),
            ]),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.noBinary,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
            ),
            Text('Non-binary'),
              ],)
            
          ],
        ),
      ],
    );
  }
}

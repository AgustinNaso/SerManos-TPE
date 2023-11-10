import 'package:flutter/material.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';

class SermanosDateField extends StatefulWidget {
  final String label;
  final SermanosIcons icon;

  const SermanosDateField({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  _SermanosDateFieldState createState() => _SermanosDateFieldState();
}

class _SermanosDateFieldState extends State<SermanosDateField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: true,
              controller: TextEditingController(
                text: _selectedDate != null ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}' : '',
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                labelText: widget.label,
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _selectDate(context),
            icon: widget.icon,
          ),
        ],
      ),
    );
  }
}

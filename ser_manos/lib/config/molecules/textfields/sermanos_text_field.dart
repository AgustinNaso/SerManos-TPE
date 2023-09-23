import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final bool enableObscure;
  final List<String? Function(String?)>? validators;

  const SermanosTextField({super.key,
    required this.hintText,
    required this.labelText,
    this.enableObscure = false,
    this.validators = const []});

  @override
  State createState() {
    return _SermanosTextField();
  }
}

class _SermanosTextField extends State<SermanosTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool _hasFocus = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() =>
        setState(() {
          _hasFocus = myFocusNode.hasFocus;
        }));
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: myFocusNode,
      controller: _textEditingController,
      validator: (value) {
        if (myFocusNode.hasFocus) {
          return null;
        }
        if (widget.validators != null) {
          for (final validator in widget.validators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.enableObscure
          ? _passwordVisible ? false : true
          : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        // error handling
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SermanosColors.red),
        ),
        floatingLabelStyle: TextStyle(
            color: _hasFocus ? SermanosColors.secondary : SermanosColors.grey),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SermanosColors.secondary),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SermanosColors.grey),
        ),
        suffixIcon: widget.enableObscure
            ? IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: SermanosColors.grey,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
            : _textEditingController.text.isNotEmpty && _hasFocus
            ? IconButton(
          icon: const Icon(Icons.clear, color: SermanosColors.grey),
          onPressed: _clearText,
        )
            : null,
      ),
    );
  }
}

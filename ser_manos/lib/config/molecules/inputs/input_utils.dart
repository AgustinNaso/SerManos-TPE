import 'package:flutter/material.dart';

inputValidator(
    dynamic value,
    List<String? Function(String?)>? validators,
    String name,
    FocusNode myFocusNode,
    void Function(String, bool)? onChangeFocus) {
  if (validators != null) {
    for (final validator in validators) {
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
}

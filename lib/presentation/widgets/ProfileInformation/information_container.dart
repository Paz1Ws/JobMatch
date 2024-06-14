import 'package:flutter/material.dart';

class InformationContainer extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final dynamic validator;

  const InformationContainer({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.amber,
      enableSuggestions: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      // ignore: unrelated_type_equality_checks
      validator: '' == validator.toString() ? null : validator,
    );
  }
}

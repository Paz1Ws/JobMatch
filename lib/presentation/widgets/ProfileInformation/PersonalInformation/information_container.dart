import 'package:flutter/material.dart';

class InformationContainer extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final dynamic validator;

  const InformationContainer({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      cursorColor: Colors.amber,
      enableSuggestions: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange), // Cambia el color aquí
        ),
      ),
      validator: '' == validator.toString() ? null : validator,
    );
  }
}

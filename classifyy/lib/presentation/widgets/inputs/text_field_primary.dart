import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const TextFieldPrimary({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}

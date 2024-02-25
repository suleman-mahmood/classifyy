import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const TextFieldPrimary({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

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

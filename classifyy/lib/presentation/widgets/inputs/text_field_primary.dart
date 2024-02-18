import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final String labelText;

  const TextFieldPrimary({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const TextArea({
    super.key,
    required this.labelText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 3,
      maxLines: 10,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}

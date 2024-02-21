import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const TextArea({
    Key? key,
    required this.labelText,
    this.controller,
  }) : super(key: key);

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

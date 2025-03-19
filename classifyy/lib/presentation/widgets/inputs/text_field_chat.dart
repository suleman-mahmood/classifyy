import 'package:flutter/material.dart';

class TextFieldChat extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;
  final TextEditingController controller;

  const TextFieldChat({
    super.key,
    required this.labelText,
    required this.onPressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}

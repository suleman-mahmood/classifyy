import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const ErrorMessage({
    super.key,
    required this.text,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.red[500],
      ),
      textAlign: textAlign,
    );
  }
}

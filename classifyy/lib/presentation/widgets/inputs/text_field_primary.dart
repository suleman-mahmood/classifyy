import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final IconData? icon;

  const TextFieldPrimary({
    super.key,
    required this.labelText,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: labelText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixIcon: icon != null ? Icon(icon, color: Colors.grey[700]) : null,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

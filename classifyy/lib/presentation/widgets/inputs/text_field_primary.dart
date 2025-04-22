import 'package:classifyy/presentation/config/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPrimary extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final IconData? icon;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  const TextFieldPrimary({
    super.key,
    required this.labelText,
    required this.controller,
    this.icon,
    this.validator,
    this.inputFormatters = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: RaabtaColors.white(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: labelText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixIcon: icon != null ? Icon(icon, color: RaabtaColors.grey()) : null,
        ),
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUnfocus,
      ),
    );
  }
}

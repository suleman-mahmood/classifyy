import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool shouldAnimate;
  final bool disabled;

  const ButtonPrimary({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.shouldAnimate = true,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor:
              disabled ? const WidgetStatePropertyAll(Colors.grey) : null,
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

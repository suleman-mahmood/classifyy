import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool shouldAnimate;
  final bool disabled;

  const ButtonPrimary({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.shouldAnimate = true,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor:
              disabled ? const MaterialStatePropertyAll(Colors.grey) : null,
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

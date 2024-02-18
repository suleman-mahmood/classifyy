import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool shouldAnimate;

  const ButtonPrimary({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.shouldAnimate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

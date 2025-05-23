import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  final String title;
  final bool shouldAnimate;
  final TextAlign textAlign;

  const TitleLarge({
    super.key,
    required this.title,
    this.shouldAnimate = true,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

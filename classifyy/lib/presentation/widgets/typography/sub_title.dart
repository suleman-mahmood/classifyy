import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String text;
  final bool shouldAnimate;
  final TextAlign textAlign;

  const SubTitle({
    super.key,
    required this.text,
    this.shouldAnimate = true,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: RaabtaColors.grey(),
        ),
        textAlign: textAlign,
      ),
    );
  }
}

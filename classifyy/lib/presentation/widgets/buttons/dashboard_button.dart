import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final VoidCallback onPressed;
  final bool shouldAnimate;

  const DashboardButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.iconData,
    this.shouldAnimate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(24),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )
          )
        ),
        child: Column(
          children: [
            Icon(iconData),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}

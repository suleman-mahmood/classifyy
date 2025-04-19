import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool shouldAnimate;
  final bool disabled;
  final bool useHorizontalPadding;

  const ButtonPrimary({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.shouldAnimate = true,
    this.disabled = false,
    this.useHorizontalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      shouldAnimate: shouldAnimate,
      child: Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(
          left: useHorizontalPadding ? 32 : 0,
          right: useHorizontalPadding ? 32 : 0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: disabled
                ? [Colors.deepPurple[100]!, Colors.deepPurple[100]!]
                : [Colors.deepPurple[500]!, Colors.deepPurple[400]!],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: ScreenSizes.slabOne),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: disabled ? Colors.deepPurple[100] : Colors.deepPurple[300],
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                ? [RaabtaColors.disabledColor(), RaabtaColors.disabledColor()]
                : [RaabtaColors.primaryDark(), RaabtaColors.primary()],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: RaabtaColors.transparent(),
            shadowColor: RaabtaColors.transparent(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: RaabtaColors.white(),
                  ),
                ),
              ),
              const SizedBox(width: ScreenSizes.slabOne),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: RaabtaColors.white(),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: disabled ? RaabtaColors.disabledColor() : RaabtaColors.primary(),
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

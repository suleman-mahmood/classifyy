import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final bool shouldAnimate;

  const FadeAnimation({
    super.key,
    required this.child,
    this.shouldAnimate = true,
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> {
  bool _shouldDisplay = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _shouldDisplay = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.shouldAnimate ? (_shouldDisplay ? 1 : 0) : 1,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      child: widget.child,
    );
  }
}

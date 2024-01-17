import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ButtonPrimary({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
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
      opacity: _shouldDisplay ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: FilledButton(
          onPressed: widget.onPressed, child: Text(widget.buttonText)),
    );
  }
}

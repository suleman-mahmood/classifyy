import 'package:flutter/material.dart';

class DashboardButton extends StatefulWidget {
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
  State<DashboardButton> createState() => _DashboardButtonState();
}

class _DashboardButtonState extends State<DashboardButton> {
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
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        onPressed: widget.onPressed,
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
            Icon(widget.iconData),
            Text(widget.buttonText),
          ],
        ),
      ),
    );
  }
}

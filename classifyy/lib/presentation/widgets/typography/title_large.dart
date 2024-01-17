import 'package:flutter/material.dart';

class TitleLarge extends StatefulWidget {
  final String title;

  const TitleLarge({Key? key, required this.title}) : super(key: key);

  @override
  State<TitleLarge> createState() => _TitleLargeState();
}

class _TitleLargeState extends State<TitleLarge> {
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
      child: Text(widget.title, style: const TextStyle(fontSize: 24)),
    );
  }
}

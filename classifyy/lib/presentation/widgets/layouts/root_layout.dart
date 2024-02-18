import 'package:flutter/material.dart';

class RootLayout extends StatefulWidget {
  final Widget child;

  const RootLayout({super.key, required this.child});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

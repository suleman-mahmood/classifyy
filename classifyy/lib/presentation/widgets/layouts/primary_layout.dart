import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/layouts/root_layout.dart';
import 'package:flutter/material.dart';

class PrimaryLayout extends StatefulWidget {
  final List<Widget> children;
  final String appBarTitle;
  final FloatingActionButton? floatingActionButton;
  final bool useStack;

  const PrimaryLayout({
    super.key,
    this.children = const [],
    required this.appBarTitle,
    this.floatingActionButton,
    this.useStack = false,
  });

  @override
  State<PrimaryLayout> createState() => _PrimaryLayoutState();
}

class _PrimaryLayoutState extends State<PrimaryLayout> {
  Widget buildCol() {
    if (widget.useStack) {
      return Stack(
        children: widget.children,
      );
    }
    return Column(children: widget.children);
  }

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle),
        ),
        floatingActionButton: widget.floatingActionButton,
        body: SafeArea(
          child: SizedBox(
            width: ScreenSizes.widthSlabFourRel(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildCol(),
            ),
          ),
        ),
      ),
    );
  }
}

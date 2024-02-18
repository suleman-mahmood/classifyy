import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/layouts/root_layout.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final List<Widget> children;

  const DashboardLayout({super.key, this.children = const []});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  bool showAdditionalClasses = false;

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: ScreenSizes.widthSlabFourRel(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Card(
                    color: const Color(0xFFFEF7FF),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person_2_outlined),
                          title: const Text('Current class'),
                          subtitle: const Text('II-B'),
                          trailing: showAdditionalClasses
                              ? const Icon(Icons.arrow_upward_outlined)
                              : const Icon(Icons.arrow_downward_outlined),
                          onTap: () {
                            setState(() {
                              showAdditionalClasses = !showAdditionalClasses;
                            });
                          },
                        ),
                        Visibility(
                          visible: showAdditionalClasses,
                          child: const Column(
                            children: [
                              ListTile(
                                title: Text('I-A'),
                              ),
                              ListTile(title: Text('I-B')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...widget.children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

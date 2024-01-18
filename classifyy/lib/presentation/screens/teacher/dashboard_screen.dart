import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/button_primary.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class II-B'),
      ),
      body: SizedBox(
        width: ScreenSizes.widthSlabFourRel(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ButtonPrimary(buttonText: 'Send announcement', onPressed: () {}),
              ButtonPrimary(
                  buttonText: 'Mark class attendance', onPressed: () {}),
              const SizedBox(height: ScreenSizes.heightSlabOneAbs),
              const Row(
                children: [
                  TitleLarge(title: 'Students'),
                  Expanded(child: SizedBox.shrink()),
                  Text('View all'),
                ],
              ),
              const SizedBox(height: ScreenSizes.heightSlabOneAbs),
              const Card(
                color: Color(0xFFFEF7FF),
                child: ListTile(
                  title: Text('Suleman Mahmood'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                color: Color(0xFFFEF7FF),
                child: ListTile(
                  title: Text('Fawaz Ahmad'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                color: Color(0xFFFEF7FF),
                child: ListTile(
                  title: Text('Shah Faraz'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                color: Color(0xFFFEF7FF),
                child: ListTile(
                  title: Text('Abdullah Khan'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                color: Color(0xFFFEF7FF),
                child: ListTile(
                  title: Text('Ahmed Karawita'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

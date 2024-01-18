import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/button_primary.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
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
              const ListTile(
                title: Text('Suleman Mahmood'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Color(0xFFFEF7FF),
              ),
              const SizedBox(height: ScreenSizes.heightSlabOneAbs),
              const ListTile(
                title: Text('Abdullah Khan Rajput'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Color(0xFFFEF7FF),
              ),
              const SizedBox(height: ScreenSizes.heightSlabOneAbs),
              const ListTile(
                title: Text('Fawaz Ahmad'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Color(0xFFFEF7FF),
              ),
              const SizedBox(height: ScreenSizes.heightSlabOneAbs),
              const ListTile(
                title: Text('Shah Faraz'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Color(0xFFFEF7FF),
              ),
              const SizedBox(height: ScreenSizes.heightSlabOneAbs),
              const ListTile(
                title: Text('Ahmed Karaweti'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Color(0xFFFEF7FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

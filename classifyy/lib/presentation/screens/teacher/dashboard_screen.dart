import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/dashboard_button.dart';
import 'package:classifyy/presentation/widgets/layouts/dashboard_layout.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

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
    return DashboardLayout(
      children: [
        const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        DashboardButton(
          buttonText: 'Announcements',
          iconData: Icons.chat_outlined,
          onPressed: () {
            context.router.push(const AnnouncementRoute());
          },
        ),
        const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        Row(
          children: [
            const TitleLarge(title: 'Students'),
            const Expanded(child: SizedBox.shrink()),
            IconButton(
              onPressed: () {
                context.router.push(const AllStudentsRoute());
              },
              icon: const Icon(Icons.search_outlined),
            ),
          ],
        ),
        const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        Card(
          color: const Color(0xFFFEF7FF),
          child: ListTile(
            title: const Text('Suleman Mahmood'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.router.push(const StudentChatRoute());
            },
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
    );
  }
}

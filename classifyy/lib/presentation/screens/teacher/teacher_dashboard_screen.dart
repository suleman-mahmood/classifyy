import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/dashboard_button.dart';
import 'package:classifyy/presentation/widgets/layouts/dashboard_layout.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen>
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
    final announcementCubit = BlocProvider.of<AnnouncementCubit>(context);

    return DashboardLayout(
      children: [
        const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        DashboardButton(
          buttonText: 'Announcements',
          iconData: Icons.chat_outlined,
          onPressed: () {
            announcementCubit.fetchAnnouncements(0, 100);
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

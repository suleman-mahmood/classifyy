import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/cubits/class_student_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
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
    final userCubit = BlocProvider.of<UserCubit>(context);
    final announcementCubit = BlocProvider.of<AnnouncementCubit>(context);
    final classStudentCubit = BlocProvider.of<ClassStudentCubit>(context);

    return DashboardLayout(
      children: [
        const SizedBox(height: ScreenSizes.slabOne),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardButton(
              buttonText: 'Announcements',
              iconData: Icons.chat_outlined,
              onPressed: () {
                announcementCubit.fetchAnnouncements(0, 100, classId: userCubit.state.selectedClass!.id);
                context.router.push(
                  AnnouncementRoute(userRole: userCubit.state.user!.userRole),
                );
              },
            ),
            const SizedBox(width: ScreenSizes.slabTwo),
            DashboardButton(
              buttonText: 'Students',
              iconData: Icons.person_2_outlined,
              onPressed: () {
                classStudentCubit.fetchClassStudents(
                  userCubit.state.selectedClass!.id,
                );
                context.router.push(const AllStudentsRoute());
              },
            ),
          ],
        ),
        // const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        // Row(
        //   children: [
        //     const TitleLarge(title: 'Students'),
        //     const Expanded(child: SizedBox.shrink()),
        //     IconButton(
        //       onPressed: () {
        //         context.router.push(const AllStudentsRoute());
        //       },
        //       icon: const Icon(Icons.search_outlined),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

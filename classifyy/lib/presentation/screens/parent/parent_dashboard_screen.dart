import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/cubits/student_teacher_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/dashboard_button.dart';
import 'package:classifyy/presentation/widgets/layouts/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ParentDashboardScreen extends StatefulWidget {
  const ParentDashboardScreen({super.key});

  @override
  State<ParentDashboardScreen> createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen>
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
    final studentTeacherCubit = BlocProvider.of<StudentTeacherCubit>(context);

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
                announcementCubit.fetchAnnouncements(
                  null,
                  userCubit.state.selectedChild!.id,
                );
                context.router.push(
                  AnnouncementRoute(userRole: userCubit.state.user!.userRole),
                );
              },
            ),
            const SizedBox(width: ScreenSizes.slabTwo),
            DashboardButton(
              buttonText: 'Teachers',
              iconData: Icons.person_2_outlined,
              onPressed: () {
                studentTeacherCubit
                    .fetchStudentTeachers(userCubit.state.selectedChild!.id);
                context.router.push(const AllTeachersRoute());
              },
            ),
          ],
        ),
        const SizedBox(height: ScreenSizes.slabOne),
      ],
    );
  }
}

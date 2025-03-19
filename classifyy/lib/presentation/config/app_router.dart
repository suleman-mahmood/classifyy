import 'package:auto_route/auto_route.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/presentation/screens/auth/login_screen.dart';
import 'package:classifyy/presentation/screens/parent/all_teachers_screen.dart';
import 'package:classifyy/presentation/screens/parent/parent_dashboard_screen.dart';
import 'package:classifyy/presentation/screens/student/student_dashboard_screen.dart';
import 'package:classifyy/presentation/screens/teacher/all_students_screen.dart';
import 'package:classifyy/presentation/screens/common/announcement_screen.dart';
import 'package:classifyy/presentation/screens/teacher/teacher_dashboard_screen.dart';
import 'package:classifyy/presentation/screens/teacher/new_announcement_screen.dart';
import 'package:classifyy/presentation/screens/teacher/student_chat_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: TeacherDashboardRoute.page),
        AutoRoute(page: ParentDashboardRoute.page),
        AutoRoute(page: StudentDashboardRoute.page),
        AutoRoute(page: AnnouncementRoute.page),
        AutoRoute(page: NewAnnouncementRoute.page),
        AutoRoute(page: StudentChatRoute.page),
        AutoRoute(page: AllStudentsRoute.page),
        AutoRoute(page: AllTeachersRoute.page),
      ];
}

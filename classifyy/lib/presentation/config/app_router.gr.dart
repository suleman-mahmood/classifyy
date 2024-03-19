// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllStudentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllStudentsScreen(),
      );
    },
    AllTeachersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllTeachersScreen(),
      );
    },
    AnnouncementRoute.name: (routeData) {
      final args = routeData.argsAs<AnnouncementRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnnouncementScreen(
          key: args.key,
          userRole: args.userRole,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    NewAnnouncementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewAnnouncementScreen(),
      );
    },
    ParentDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ParentDashboardScreen(),
      );
    },
    StudentChatRoute.name: (routeData) {
      final args = routeData.argsAs<StudentChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentChatScreen(
          key: args.key,
          studentName: args.studentName,
          otherUserId: args.otherUserId,
        ),
      );
    },
    StudentDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentDashboardScreen(),
      );
    },
    TeacherDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherDashboardScreen(),
      );
    },
  };
}

/// generated route for
/// [AllStudentsScreen]
class AllStudentsRoute extends PageRouteInfo<void> {
  const AllStudentsRoute({List<PageRouteInfo>? children})
      : super(
          AllStudentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllStudentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllTeachersScreen]
class AllTeachersRoute extends PageRouteInfo<void> {
  const AllTeachersRoute({List<PageRouteInfo>? children})
      : super(
          AllTeachersRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTeachersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnnouncementScreen]
class AnnouncementRoute extends PageRouteInfo<AnnouncementRouteArgs> {
  AnnouncementRoute({
    Key? key,
    required UserRole userRole,
    List<PageRouteInfo>? children,
  }) : super(
          AnnouncementRoute.name,
          args: AnnouncementRouteArgs(
            key: key,
            userRole: userRole,
          ),
          initialChildren: children,
        );

  static const String name = 'AnnouncementRoute';

  static const PageInfo<AnnouncementRouteArgs> page =
      PageInfo<AnnouncementRouteArgs>(name);
}

class AnnouncementRouteArgs {
  const AnnouncementRouteArgs({
    this.key,
    required this.userRole,
  });

  final Key? key;

  final UserRole userRole;

  @override
  String toString() {
    return 'AnnouncementRouteArgs{key: $key, userRole: $userRole}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NewAnnouncementScreen]
class NewAnnouncementRoute extends PageRouteInfo<void> {
  const NewAnnouncementRoute({List<PageRouteInfo>? children})
      : super(
          NewAnnouncementRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewAnnouncementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ParentDashboardScreen]
class ParentDashboardRoute extends PageRouteInfo<void> {
  const ParentDashboardRoute({List<PageRouteInfo>? children})
      : super(
          ParentDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'ParentDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentChatScreen]
class StudentChatRoute extends PageRouteInfo<StudentChatRouteArgs> {
  StudentChatRoute({
    Key? key,
    required String studentName,
    required String otherUserId,
    List<PageRouteInfo>? children,
  }) : super(
          StudentChatRoute.name,
          args: StudentChatRouteArgs(
            key: key,
            studentName: studentName,
            otherUserId: otherUserId,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentChatRoute';

  static const PageInfo<StudentChatRouteArgs> page =
      PageInfo<StudentChatRouteArgs>(name);
}

class StudentChatRouteArgs {
  const StudentChatRouteArgs({
    this.key,
    required this.studentName,
    required this.otherUserId,
  });

  final Key? key;

  final String studentName;

  final String otherUserId;

  @override
  String toString() {
    return 'StudentChatRouteArgs{key: $key, studentName: $studentName, otherUserId: $otherUserId}';
  }
}

/// generated route for
/// [StudentDashboardScreen]
class StudentDashboardRoute extends PageRouteInfo<void> {
  const StudentDashboardRoute({List<PageRouteInfo>? children})
      : super(
          StudentDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherDashboardScreen]
class TeacherDashboardRoute extends PageRouteInfo<void> {
  const TeacherDashboardRoute({List<PageRouteInfo>? children})
      : super(
          TeacherDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

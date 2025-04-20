// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AllStudentsScreen]
class AllStudentsRoute extends PageRouteInfo<void> {
  const AllStudentsRoute({List<PageRouteInfo>? children})
      : super(AllStudentsRoute.name, initialChildren: children);

  static const String name = 'AllStudentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AllStudentsScreen();
    },
  );
}

/// generated route for
/// [AllTeachersScreen]
class AllTeachersRoute extends PageRouteInfo<void> {
  const AllTeachersRoute({List<PageRouteInfo>? children})
      : super(AllTeachersRoute.name, initialChildren: children);

  static const String name = 'AllTeachersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AllTeachersScreen();
    },
  );
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
          args: AnnouncementRouteArgs(key: key, userRole: userRole),
          initialChildren: children,
        );

  static const String name = 'AnnouncementRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnnouncementRouteArgs>();
      return AnnouncementScreen(key: args.key, userRole: args.userRole);
    },
  );
}

class AnnouncementRouteArgs {
  const AnnouncementRouteArgs({this.key, required this.userRole});

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
  LoginRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginScreen(key: args.key);
    },
  );
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
      : super(NewAnnouncementRoute.name, initialChildren: children);

  static const String name = 'NewAnnouncementRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewAnnouncementScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [ParentDashboardScreen]
class ParentDashboardRoute extends PageRouteInfo<void> {
  const ParentDashboardRoute({List<PageRouteInfo>? children})
      : super(ParentDashboardRoute.name, initialChildren: children);

  static const String name = 'ParentDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ParentDashboardScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudentChatRouteArgs>();
      return StudentChatScreen(
        key: args.key,
        studentName: args.studentName,
        otherUserId: args.otherUserId,
      );
    },
  );
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
      : super(StudentDashboardRoute.name, initialChildren: children);

  static const String name = 'StudentDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StudentDashboardScreen();
    },
  );
}

/// generated route for
/// [TeacherDashboardScreen]
class TeacherDashboardRoute extends PageRouteInfo<void> {
  const TeacherDashboardRoute({List<PageRouteInfo>? children})
      : super(TeacherDashboardRoute.name, initialChildren: children);

  static const String name = 'TeacherDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TeacherDashboardScreen();
    },
  );
}

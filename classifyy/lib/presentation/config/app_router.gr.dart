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
    AnnouncementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnnouncementScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentChatScreen(),
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
/// [AnnouncementScreen]
class AnnouncementRoute extends PageRouteInfo<void> {
  const AnnouncementRoute({List<PageRouteInfo>? children})
      : super(
          AnnouncementRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnouncementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
class StudentChatRoute extends PageRouteInfo<void> {
  const StudentChatRoute({List<PageRouteInfo>? children})
      : super(
          StudentChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentChatRoute';

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

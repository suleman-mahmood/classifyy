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
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
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
    StudentChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentChatScreen(),
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
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

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

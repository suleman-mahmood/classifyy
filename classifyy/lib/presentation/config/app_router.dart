import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/screens/auth/login_screen.dart';
import 'package:classifyy/presentation/screens/teacher/dashboard_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page),
      ];
}

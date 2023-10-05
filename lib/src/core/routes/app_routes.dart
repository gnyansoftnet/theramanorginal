import 'package:auto_route/auto_route.dart';

import 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: UserTypeRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page, path: "/LoginRoute"),
        AutoRoute(page: VarifyOtpRoute.page, path: "/VerifyOtpRoute"),
        AutoRoute(
            page: HomeRoute.page,
            initial: false,
            path: '/HomeRoute',
            children: [
              AutoRoute(
                page: DashboardRoute.page,
              ),
              AutoRoute(
                page: UserProfileRoute.page,
              )
            ])
      ];
}

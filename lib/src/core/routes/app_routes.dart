import 'package:auto_route/auto_route.dart';

import 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: UserTypeRoute.page,
          path: '/UserTypeRoute',
        ),
        AutoRoute(page: MobileNumberRoute.page, path: "/LoginRoute"),
        AutoRoute(page: VerifyOtpRoute.page, path: "/VerifyOtpRoute"),
        AutoRoute(
          page: DashboardRoute.page,
          path: "/DashboardRoute",
        ),
        AutoRoute(page: UserProfileRoute.page, path: "/UserProfileRoute"),
        AutoRoute(
            page: TomorrowSessionRoute.page, path: "/TomorrowSessionRoute"),
        AutoRoute(page: ApplyLeaveRoute.page, path: "/ApplyLeaveRoute"),
        AutoRoute(page: LeaveStatusRoute.page, path: "/LeaveStatusRoute"),

        // AutoRoute(
        //     page: HomeRoute.page,
        //     initial: false,
        //     path: '/HomeRoute',
        //     children: [
        //       AutoRoute(
        //         page: DashboardRoute.page,
        //       ),
        //       AutoRoute(
        //         page: UserProfileRoute.page,
        //       )
        //     ])
      ];
}

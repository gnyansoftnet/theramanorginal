import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
        CustomRoute(
          page: LoginRoute.page,
          path: "/LoginRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
        CustomRoute(
          page: MobileNumberRoute.page,
          path: "/MobileNumberRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
        CustomRoute(
          page: VerifyOtpRoute.page,
          path: "/VerifyOtpRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
        CustomRoute(
          page: DashboardRoute.page,
          path: "/DashboardRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
        AutoRoute(page: UserProfileRoute.page, path: "/UserProfileRoute"),
        AutoRoute(
            page: TomorrowSessionRoute.page, path: "/TomorrowSessionRoute"),
        AutoRoute(page: ApplyLeaveRoute.page, path: "/ApplyLeaveRoute"),
        AutoRoute(page: LeaveStatusRoute.page, path: "/LeaveStatusRoute"),

        // executive route
        AutoRoute(
          page: ExecutiveOngoingSessionRoute.page,
          path: "/ExecutiveOngoingSessionRoute",
        ),
        AutoRoute(
            page: ExecutiveCompletedSessionRoute.page,
            path: "/ExecutiveCompletedSessionRoute"),
        AutoRoute(
            page: ExecutiveCancelledSessionRoute.page,
            path: "/ExecutiveCancelledSessionRoute"),
        AutoRoute(page: CancelSessionRoute.page, path: "/CancelSessionRoute"),
        AutoRoute(
            page: ChangeTherapistRoute.page, path: "/ChangeTherapistRoute"),
        AutoRoute(
            page: SessionRescheduleRoute.page, path: "/SessionRescheduleRoute"),
        AutoRoute(
            page: ExeTomorrowSessionRoute.page,
            path: "/ExeTomorrowSessionRoute"),
        AutoRoute(page: ExeLeaveStatusRoute.page, path: "/ExeLeaveStatusRoute"),
        CustomRoute(
          page: LoadingDialogRoute.page,
          path: '/loadingDialogRoute',
          customRouteBuilder: <T>(context, child, AutoRoutePage<T> page) {
            return DialogRoute(
              context: context,
              settings: page,
              builder: (_) => child,
            );
          },
        ),
        AutoRoute(page: ExeApplyLeaveRoute.page, path: "/ExeApplyLeaveRoute"),
        AutoRoute(page: SessionReportRoute.page, path: "/SessionReportRoute")
      ];
}

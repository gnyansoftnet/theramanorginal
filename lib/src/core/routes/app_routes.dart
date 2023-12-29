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
        CustomRoute(
          page: UserTypeRoute.page,
          path: '/UserTypeRoute',
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: LoginRoute.page,
          path: "/LoginRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: MobileNumberRoute.page,
          path: "/MobileNumberRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: VerifyOtpRoute.page,
          path: "/VerifyOtpRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: DashboardRoute.page,
          path: "/DashboardRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: UserProfileRoute.page,
          path: "/UserProfileRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: TomorrowSessionRoute.page,
          path: "/TomorrowSessionRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: ApplyLeaveRoute.page,
          path: "/ApplyLeaveRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(page: LeaveStatusRoute.page, path: "/LeaveStatusRoute"),

        // executive route
        CustomRoute(
          page: ExecutiveOngoingSessionRoute.page,
          path: "/ExecutiveOngoingSessionRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: ExecutiveCompletedSessionRoute.page,
          path: "/ExecutiveCompletedSessionRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),

        CustomRoute(
          page: ExecutiveCancelledSessionRoute.page,
          path: "/ExecutiveCancelledSessionRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: CancelSessionRoute.page,
          path: "/CancelSessionRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: ChangeTherapistRoute.page,
          path: "/ChangeTherapistRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: SessionRescheduleRoute.page,
          path: "/SessionRescheduleRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: ExeTomorrowSessionRoute.page,
          path: "/ExeTomorrowSessionRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: ExeLeaveStatusRoute.page,
          path: "/ExeLeaveStatusRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
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
        CustomRoute(
          page: ExeApplyLeaveRoute.page,
          path: "/ExeApplyLeaveRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),
        CustomRoute(
          page: SessionReportRoute.page,
          path: "/SessionReportRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        ),

        CustomRoute(
          page: SettingRoute.page,
          path: "/SettingRoute",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return slidAnimation(animation, child);
          },
        )
      ];

  SlideTransition slidAnimation(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

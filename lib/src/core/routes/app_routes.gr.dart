// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:theraman/src/features/authentication/presentation/screen/login_screen.dart'
    deferred as _i5;
import 'package:theraman/src/features/authentication/presentation/screen/user_type_screen.dart'
    deferred as _i10;
import 'package:theraman/src/features/authentication/presentation/screen/verify_otp_screen.dart'
    deferred as _i11;
import 'package:theraman/src/features/dashboard/presentation/screen/completed_session_screen.dart'
    deferred as _i2;
import 'package:theraman/src/features/dashboard/presentation/screen/dashboard_screen.dart'
    deferred as _i3;
import 'package:theraman/src/features/dashboard/presentation/screen/ongoing_session_screen.dart'
    deferred as _i6;
import 'package:theraman/src/features/home/home_screen.dart' deferred as _i4;
import 'package:theraman/src/features/splash/screen/splash_screen.dart'
    deferred as _i7;
import 'package:theraman/src/features/user/presentation/screen/apply_leave_screen.dart'
    deferred as _i1;
import 'package:theraman/src/features/user/presentation/screen/tomorrow_session_screen.dart'
    deferred as _i8;
import 'package:theraman/src/features/user/presentation/screen/user_profile_screen.dart'
    deferred as _i9;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ApplyLeaveRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.ApplyLeaveScreen(),
        ),
      );
    },
    CompletedSessionRoute.name: (routeData) {
      final args = routeData.argsAs<CompletedSessionRouteArgs>(
          orElse: () => const CompletedSessionRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.CompletedSessionScreen(key: args.key),
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.DashboardScreen(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.HomeScreen(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.LoginScreen(
            key: args.key,
            userType: args.userType,
          ),
        ),
      );
    },
    OnGoingSessionRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.OnGoingSessionScreen(),
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.SplashScreen(),
        ),
      );
    },
    TomorrowSessionRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.TomorrowSessionScreen(),
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.UserProfileScreen(),
        ),
      );
    },
    UserTypeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.UserTypeScreen(),
        ),
      );
    },
    VarifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VarifyOtpRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DeferredWidget(
          _i11.loadLibrary,
          () => _i11.VerifyOtpScreen(
            key: args.key,
            mobileNoController: args.mobileNoController,
            userType: args.userType,
          ),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ApplyLeaveScreen]
class ApplyLeaveRoute extends _i12.PageRouteInfo<void> {
  const ApplyLeaveRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ApplyLeaveRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplyLeaveRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CompletedSessionScreen]
class CompletedSessionRoute
    extends _i12.PageRouteInfo<CompletedSessionRouteArgs> {
  CompletedSessionRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CompletedSessionRoute.name,
          args: CompletedSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CompletedSessionRoute';

  static const _i12.PageInfo<CompletedSessionRouteArgs> page =
      _i12.PageInfo<CompletedSessionRouteArgs>(name);
}

class CompletedSessionRouteArgs {
  const CompletedSessionRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'CompletedSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i13.Key? key,
    required String userType,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<LoginRouteArgs> page =
      _i12.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.userType,
  });

  final _i13.Key? key;

  final String userType;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i6.OnGoingSessionScreen]
class OnGoingSessionRoute extends _i12.PageRouteInfo<void> {
  const OnGoingSessionRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnGoingSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnGoingSessionRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TomorrowSessionScreen]
class TomorrowSessionRoute extends _i12.PageRouteInfo<void> {
  const TomorrowSessionRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TomorrowSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TomorrowSessionRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.UserProfileScreen]
class UserProfileRoute extends _i12.PageRouteInfo<void> {
  const UserProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.UserTypeScreen]
class UserTypeRoute extends _i12.PageRouteInfo<void> {
  const UserTypeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.VerifyOtpScreen]
class VarifyOtpRoute extends _i12.PageRouteInfo<VarifyOtpRouteArgs> {
  VarifyOtpRoute({
    _i13.Key? key,
    required _i13.TextEditingController mobileNoController,
    required String userType,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          VarifyOtpRoute.name,
          args: VarifyOtpRouteArgs(
            key: key,
            mobileNoController: mobileNoController,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'VarifyOtpRoute';

  static const _i12.PageInfo<VarifyOtpRouteArgs> page =
      _i12.PageInfo<VarifyOtpRouteArgs>(name);
}

class VarifyOtpRouteArgs {
  const VarifyOtpRouteArgs({
    this.key,
    required this.mobileNoController,
    required this.userType,
  });

  final _i13.Key? key;

  final _i13.TextEditingController mobileNoController;

  final String userType;

  @override
  String toString() {
    return 'VarifyOtpRouteArgs{key: $key, mobileNoController: $mobileNoController, userType: $userType}';
  }
}

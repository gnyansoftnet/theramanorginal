// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:theraman/src/features/authentication/screen/login_screen.dart'
    deferred as _i3;
import 'package:theraman/src/features/authentication/screen/user_type_screen.dart'
    deferred as _i6;
import 'package:theraman/src/features/authentication/screen/verify_otp_screen.dart'
    deferred as _i7;
import 'package:theraman/src/features/dashboard/screen/dashboard_screen.dart'
    deferred as _i1;
import 'package:theraman/src/features/home/home_screen.dart' deferred as _i2;
import 'package:theraman/src/features/splash/screen/splash_screen.dart'
    deferred as _i4;
import 'package:theraman/src/features/user/screen/user_profile_screen.dart'
    deferred as _i5;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.DashboardScreen(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.HomeScreen(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginScreen(
            key: args.key,
            userType: args.userType,
          ),
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.SplashScreen(),
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.UserProfileScreen(),
        ),
      );
    },
    UserTypeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.UserTypeScreen(),
        ),
      );
    },
    VarifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VarifyOtpRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.VerifyOtpScreen(
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
/// [_i1.DashboardScreen]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    required String userType,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<LoginRouteArgs> page =
      _i8.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.userType,
  });

  final _i9.Key? key;

  final String userType;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UserProfileScreen]
class UserProfileRoute extends _i8.PageRouteInfo<void> {
  const UserProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UserTypeScreen]
class UserTypeRoute extends _i8.PageRouteInfo<void> {
  const UserTypeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.VerifyOtpScreen]
class VarifyOtpRoute extends _i8.PageRouteInfo<VarifyOtpRouteArgs> {
  VarifyOtpRoute({
    _i9.Key? key,
    required _i9.TextEditingController mobileNoController,
    required String userType,
    List<_i8.PageRouteInfo>? children,
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

  static const _i8.PageInfo<VarifyOtpRouteArgs> page =
      _i8.PageInfo<VarifyOtpRouteArgs>(name);
}

class VarifyOtpRouteArgs {
  const VarifyOtpRouteArgs({
    this.key,
    required this.mobileNoController,
    required this.userType,
  });

  final _i9.Key? key;

  final _i9.TextEditingController mobileNoController;

  final String userType;

  @override
  String toString() {
    return 'VarifyOtpRouteArgs{key: $key, mobileNoController: $mobileNoController, userType: $userType}';
  }
}

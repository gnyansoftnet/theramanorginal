// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:theraman/src/features/authentication/screen/login_screen.dart'
    deferred as _i3;
import 'package:theraman/src/features/authentication/screen/user_type_screen.dart'
    deferred as _i5;
import 'package:theraman/src/features/authentication/screen/verify_otp_screen.dart'
    deferred as _i6;
import 'package:theraman/src/features/dashboard/screen/dashboard_screen.dart'
    deferred as _i1;
import 'package:theraman/src/features/home/home_screen.dart' deferred as _i2;
import 'package:theraman/src/features/user/screen/user_profile_screen.dart'
    deferred as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.DashboardScreen(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.HomeScreen(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginScreen(
            key: args.key,
            userType: args.userType,
          ),
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.UserProfile(),
        ),
      );
    },
    UserTypeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.UserTypeScreen(),
        ),
      );
    },
    VarifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VarifyOtpRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.VerifyOtpScreen(
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
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i8.Key? key,
    required String userType,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<LoginRouteArgs> page =
      _i7.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.userType,
  });

  final _i8.Key? key;

  final String userType;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i4.UserProfile]
class UserProfileRoute extends _i7.PageRouteInfo<void> {
  const UserProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UserTypeScreen]
class UserTypeRoute extends _i7.PageRouteInfo<void> {
  const UserTypeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.VerifyOtpScreen]
class VarifyOtpRoute extends _i7.PageRouteInfo<VarifyOtpRouteArgs> {
  VarifyOtpRoute({
    _i8.Key? key,
    required _i8.TextEditingController mobileNoController,
    required String userType,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<VarifyOtpRouteArgs> page =
      _i7.PageInfo<VarifyOtpRouteArgs>(name);
}

class VarifyOtpRouteArgs {
  const VarifyOtpRouteArgs({
    this.key,
    required this.mobileNoController,
    required this.userType,
  });

  final _i8.Key? key;

  final _i8.TextEditingController mobileNoController;

  final String userType;

  @override
  String toString() {
    return 'VarifyOtpRouteArgs{key: $key, mobileNoController: $mobileNoController, userType: $userType}';
  }
}

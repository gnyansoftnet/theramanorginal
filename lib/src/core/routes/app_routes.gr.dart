// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:theraman/src/features/authentication/presentation/screen/mobile_number_screen.dart'
    deferred as _i11;
import 'package:theraman/src/features/authentication/presentation/screen/user_type_screen.dart'
    deferred as _i17;
import 'package:theraman/src/features/authentication/presentation/screen/verify_otp_screen.dart'
    deferred as _i18;
import 'package:theraman/src/features/dashboard/presentation/dashboard_screen.dart'
    deferred as _i5;
import 'package:theraman/src/features/dashboard/presentation/executive/screen/cancel_session_screen.dart'
    deferred as _i2;
import 'package:theraman/src/features/dashboard/presentation/executive/screen/change_therapist_screen.dart'
    deferred as _i3;
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_cancelled_session_screen.dart'
    deferred as _i7;
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_completed_session_screen.dart'
    deferred as _i8;
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_ongoing_session_screen.dart'
    deferred as _i9;
import 'package:theraman/src/features/dashboard/presentation/executive/screen/session_reschedule_screen.dart'
    deferred as _i13;
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/completed_session_screen.dart'
    deferred as _i4;
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/ongoing_session_screen.dart'
    deferred as _i12;
import 'package:theraman/src/features/splash/screen/splash_screen.dart'
    deferred as _i14;
import 'package:theraman/src/features/tomorrow_session/presentation/executive/screen/exe_tomorrow_session_screen.dart'
    deferred as _i6;
import 'package:theraman/src/features/user/presentation/screen/apply_leave_screen.dart'
    deferred as _i1;
import 'package:theraman/src/features/user/presentation/screen/leave_status_screen.dart'
    deferred as _i10;
import 'package:theraman/src/features/user/presentation/screen/tomorrow_session_screen.dart'
    deferred as _i15;
import 'package:theraman/src/features/user/presentation/screen/user_profile_screen.dart'
    deferred as _i16;
import 'package:theraman/src/global/model/alloted_slot_response_model.dart'
    as _i21;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    ApplyLeaveRoute.name: (routeData) {
      final args = routeData.argsAs<ApplyLeaveRouteArgs>(
          orElse: () => const ApplyLeaveRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.ApplyLeaveScreen(key: args.key),
        ),
      );
    },
    CancelSessionRoute.name: (routeData) {
      final args = routeData.argsAs<CancelSessionRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.CancelSessionScreen(
            key: args.key,
            allotSlots: args.allotSlots,
          ),
        ),
      );
    },
    ChangeTherapistRoute.name: (routeData) {
      final args = routeData.argsAs<ChangeTherapistRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.ChangeTherapistScreen(
            key: args.key,
            allotSlots: args.allotSlots,
          ),
        ),
      );
    },
    CompletedSessionRoute.name: (routeData) {
      final args = routeData.argsAs<CompletedSessionRouteArgs>(
          orElse: () => const CompletedSessionRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.CompletedSessionScreen(key: args.key),
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.DashboardScreen(),
        ),
      );
    },
    ExeTomorrowSessionRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.ExeTomorrowSessionScreen(),
        ),
      );
    },
    ExecutiveCancelledSessionRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.ExecutiveCancelledSessionScreen(),
        ),
      );
    },
    ExecutiveCompletedSessionRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.ExecutiveCompletedSessionScreen(),
        ),
      );
    },
    ExecutiveOngoingSessionRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.ExecutiveOngoingSessionScreen(),
        ),
      );
    },
    LeaveStatusRoute.name: (routeData) {
      final args = routeData.argsAs<LeaveStatusRouteArgs>(
          orElse: () => const LeaveStatusRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.LeaveStatusScreen(key: args.key),
        ),
      );
    },
    MobileNumberRoute.name: (routeData) {
      final args = routeData.argsAs<MobileNumberRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i11.loadLibrary,
          () => _i11.MobileNumberScreen(
            key: args.key,
            userType: args.userType,
          ),
        ),
      );
    },
    OnGoingSessionRoute.name: (routeData) {
      final args = routeData.argsAs<OnGoingSessionRouteArgs>(
          orElse: () => const OnGoingSessionRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i12.loadLibrary,
          () => _i12.OnGoingSessionScreen(key: args.key),
        ),
      );
    },
    SessionRescheduleRoute.name: (routeData) {
      final args = routeData.argsAs<SessionRescheduleRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i13.loadLibrary,
          () => _i13.SessionRescheduleScreen(
            key: args.key,
            allotSlots: args.allotSlots,
          ),
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i14.loadLibrary,
          () => _i14.SplashScreen(),
        ),
      );
    },
    TomorrowSessionRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i15.loadLibrary,
          () => _i15.TomorrowSessionScreen(),
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () => const UserProfileRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i16.loadLibrary,
          () => _i16.UserProfileScreen(key: args.key),
        ),
      );
    },
    UserTypeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i17.loadLibrary,
          () => _i17.UserTypeScreen(),
        ),
      );
    },
    VerifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyOtpRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i18.loadLibrary,
          () => _i18.VerifyOtpScreen(
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
class ApplyLeaveRoute extends _i19.PageRouteInfo<ApplyLeaveRouteArgs> {
  ApplyLeaveRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ApplyLeaveRoute.name,
          args: ApplyLeaveRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ApplyLeaveRoute';

  static const _i19.PageInfo<ApplyLeaveRouteArgs> page =
      _i19.PageInfo<ApplyLeaveRouteArgs>(name);
}

class ApplyLeaveRouteArgs {
  const ApplyLeaveRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'ApplyLeaveRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CancelSessionScreen]
class CancelSessionRoute extends _i19.PageRouteInfo<CancelSessionRouteArgs> {
  CancelSessionRoute({
    _i20.Key? key,
    required _i21.AllotSlots allotSlots,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CancelSessionRoute.name,
          args: CancelSessionRouteArgs(
            key: key,
            allotSlots: allotSlots,
          ),
          initialChildren: children,
        );

  static const String name = 'CancelSessionRoute';

  static const _i19.PageInfo<CancelSessionRouteArgs> page =
      _i19.PageInfo<CancelSessionRouteArgs>(name);
}

class CancelSessionRouteArgs {
  const CancelSessionRouteArgs({
    this.key,
    required this.allotSlots,
  });

  final _i20.Key? key;

  final _i21.AllotSlots allotSlots;

  @override
  String toString() {
    return 'CancelSessionRouteArgs{key: $key, allotSlots: $allotSlots}';
  }
}

/// generated route for
/// [_i3.ChangeTherapistScreen]
class ChangeTherapistRoute
    extends _i19.PageRouteInfo<ChangeTherapistRouteArgs> {
  ChangeTherapistRoute({
    _i20.Key? key,
    required _i21.AllotSlots allotSlots,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ChangeTherapistRoute.name,
          args: ChangeTherapistRouteArgs(
            key: key,
            allotSlots: allotSlots,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangeTherapistRoute';

  static const _i19.PageInfo<ChangeTherapistRouteArgs> page =
      _i19.PageInfo<ChangeTherapistRouteArgs>(name);
}

class ChangeTherapistRouteArgs {
  const ChangeTherapistRouteArgs({
    this.key,
    required this.allotSlots,
  });

  final _i20.Key? key;

  final _i21.AllotSlots allotSlots;

  @override
  String toString() {
    return 'ChangeTherapistRouteArgs{key: $key, allotSlots: $allotSlots}';
  }
}

/// generated route for
/// [_i4.CompletedSessionScreen]
class CompletedSessionRoute
    extends _i19.PageRouteInfo<CompletedSessionRouteArgs> {
  CompletedSessionRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CompletedSessionRoute.name,
          args: CompletedSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CompletedSessionRoute';

  static const _i19.PageInfo<CompletedSessionRouteArgs> page =
      _i19.PageInfo<CompletedSessionRouteArgs>(name);
}

class CompletedSessionRouteArgs {
  const CompletedSessionRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'CompletedSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.DashboardScreen]
class DashboardRoute extends _i19.PageRouteInfo<void> {
  const DashboardRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ExeTomorrowSessionScreen]
class ExeTomorrowSessionRoute extends _i19.PageRouteInfo<void> {
  const ExeTomorrowSessionRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ExeTomorrowSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExeTomorrowSessionRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ExecutiveCancelledSessionScreen]
class ExecutiveCancelledSessionRoute extends _i19.PageRouteInfo<void> {
  const ExecutiveCancelledSessionRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ExecutiveCancelledSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExecutiveCancelledSessionRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ExecutiveCompletedSessionScreen]
class ExecutiveCompletedSessionRoute extends _i19.PageRouteInfo<void> {
  const ExecutiveCompletedSessionRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ExecutiveCompletedSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExecutiveCompletedSessionRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ExecutiveOngoingSessionScreen]
class ExecutiveOngoingSessionRoute extends _i19.PageRouteInfo<void> {
  const ExecutiveOngoingSessionRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ExecutiveOngoingSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExecutiveOngoingSessionRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LeaveStatusScreen]
class LeaveStatusRoute extends _i19.PageRouteInfo<LeaveStatusRouteArgs> {
  LeaveStatusRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          LeaveStatusRoute.name,
          args: LeaveStatusRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LeaveStatusRoute';

  static const _i19.PageInfo<LeaveStatusRouteArgs> page =
      _i19.PageInfo<LeaveStatusRouteArgs>(name);
}

class LeaveStatusRouteArgs {
  const LeaveStatusRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'LeaveStatusRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MobileNumberScreen]
class MobileNumberRoute extends _i19.PageRouteInfo<MobileNumberRouteArgs> {
  MobileNumberRoute({
    _i20.Key? key,
    required String userType,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          MobileNumberRoute.name,
          args: MobileNumberRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'MobileNumberRoute';

  static const _i19.PageInfo<MobileNumberRouteArgs> page =
      _i19.PageInfo<MobileNumberRouteArgs>(name);
}

class MobileNumberRouteArgs {
  const MobileNumberRouteArgs({
    this.key,
    required this.userType,
  });

  final _i20.Key? key;

  final String userType;

  @override
  String toString() {
    return 'MobileNumberRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i12.OnGoingSessionScreen]
class OnGoingSessionRoute extends _i19.PageRouteInfo<OnGoingSessionRouteArgs> {
  OnGoingSessionRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          OnGoingSessionRoute.name,
          args: OnGoingSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnGoingSessionRoute';

  static const _i19.PageInfo<OnGoingSessionRouteArgs> page =
      _i19.PageInfo<OnGoingSessionRouteArgs>(name);
}

class OnGoingSessionRouteArgs {
  const OnGoingSessionRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'OnGoingSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.SessionRescheduleScreen]
class SessionRescheduleRoute
    extends _i19.PageRouteInfo<SessionRescheduleRouteArgs> {
  SessionRescheduleRoute({
    _i20.Key? key,
    required _i21.AllotSlots allotSlots,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SessionRescheduleRoute.name,
          args: SessionRescheduleRouteArgs(
            key: key,
            allotSlots: allotSlots,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionRescheduleRoute';

  static const _i19.PageInfo<SessionRescheduleRouteArgs> page =
      _i19.PageInfo<SessionRescheduleRouteArgs>(name);
}

class SessionRescheduleRouteArgs {
  const SessionRescheduleRouteArgs({
    this.key,
    required this.allotSlots,
  });

  final _i20.Key? key;

  final _i21.AllotSlots allotSlots;

  @override
  String toString() {
    return 'SessionRescheduleRouteArgs{key: $key, allotSlots: $allotSlots}';
  }
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.TomorrowSessionScreen]
class TomorrowSessionRoute extends _i19.PageRouteInfo<void> {
  const TomorrowSessionRoute({List<_i19.PageRouteInfo>? children})
      : super(
          TomorrowSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TomorrowSessionRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.UserProfileScreen]
class UserProfileRoute extends _i19.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i19.PageInfo<UserProfileRouteArgs> page =
      _i19.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.UserTypeScreen]
class UserTypeRoute extends _i19.PageRouteInfo<void> {
  const UserTypeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.VerifyOtpScreen]
class VerifyOtpRoute extends _i19.PageRouteInfo<VerifyOtpRouteArgs> {
  VerifyOtpRoute({
    _i20.Key? key,
    required _i20.TextEditingController mobileNoController,
    required String userType,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          VerifyOtpRoute.name,
          args: VerifyOtpRouteArgs(
            key: key,
            mobileNoController: mobileNoController,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyOtpRoute';

  static const _i19.PageInfo<VerifyOtpRouteArgs> page =
      _i19.PageInfo<VerifyOtpRouteArgs>(name);
}

class VerifyOtpRouteArgs {
  const VerifyOtpRouteArgs({
    this.key,
    required this.mobileNoController,
    required this.userType,
  });

  final _i20.Key? key;

  final _i20.TextEditingController mobileNoController;

  final String userType;

  @override
  String toString() {
    return 'VerifyOtpRouteArgs{key: $key, mobileNoController: $mobileNoController, userType: $userType}';
  }
}

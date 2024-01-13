// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:theraman/src/features/authentication/presentation/screen/login_screen.dart'
    deferred as _i15;
import 'package:theraman/src/features/authentication/presentation/screen/mobile_number_screen.dart'
    deferred as _i16;
import 'package:theraman/src/features/authentication/presentation/screen/user_type_screen.dart'
    deferred as _i23;
import 'package:theraman/src/features/authentication/presentation/screen/verify_otp_screen.dart'
    deferred as _i24;
import 'package:theraman/src/features/dashboard/dashboard_screen.dart'
    deferred as _i7;
import 'package:theraman/src/features/executive/presentation/screen/cancel_session_screen.dart'
    deferred as _i3;
import 'package:theraman/src/features/executive/presentation/screen/change_therapist_screen.dart'
    deferred as _i5;
import 'package:theraman/src/features/executive/presentation/screen/exe_apply_leave_screen.dart'
    deferred as _i8;
import 'package:theraman/src/features/executive/presentation/screen/exe_leave_status_screen.dart'
    deferred as _i9;
import 'package:theraman/src/features/executive/presentation/screen/exe_tomorrow_session_screen.dart'
    deferred as _i10;
import 'package:theraman/src/features/executive/presentation/screen/executive_cancelled_session_screen.dart'
    deferred as _i11;
import 'package:theraman/src/features/executive/presentation/screen/executive_completed_session_screen.dart'
    deferred as _i12;
import 'package:theraman/src/features/executive/presentation/screen/executive_ongoing_session_screen.dart'
    deferred as _i13;
import 'package:theraman/src/features/executive/presentation/screen/session_reschedule_screen.dart'
    deferred as _i20;
import 'package:theraman/src/features/profile/presentation/screen/change_password_screen.dart'
    deferred as _i4;
import 'package:theraman/src/features/profile/presentation/screen/profile_screen.dart'
    deferred as _i18;
import 'package:theraman/src/features/splash/splash_screen.dart'
    deferred as _i21;
import 'package:theraman/src/features/therapist/presentation/screen/apply_leave_screen.dart'
    deferred as _i2;
import 'package:theraman/src/features/therapist/presentation/screen/completed_session_screen.dart'
    deferred as _i6;
import 'package:theraman/src/features/therapist/presentation/screen/leave_status_screen.dart'
    deferred as _i14;
import 'package:theraman/src/features/therapist/presentation/screen/ongoing_session_screen.dart'
    deferred as _i17;
import 'package:theraman/src/features/therapist/presentation/screen/session_report_screen.dart'
    deferred as _i19;
import 'package:theraman/src/features/therapist/presentation/screen/tomorrow_session_screen.dart'
    deferred as _i22;
import 'package:theraman/src/global/model/alloted_slot_response_model.dart'
    as _i27;
import 'package:theraman/src/global/widgets/app_loading_dialog.dart'
    deferred as _i1;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    LoadingDialogRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AppLoadingDialog(),
        ),
      );
    },
    ApplyLeaveRoute.name: (routeData) {
      final args = routeData.argsAs<ApplyLeaveRouteArgs>(
          orElse: () => const ApplyLeaveRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.ApplyLeaveScreen(key: args.key),
        ),
      );
    },
    CancelSessionRoute.name: (routeData) {
      final args = routeData.argsAs<CancelSessionRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.CancelSessionScreen(
            key: args.key,
            allotSlots: args.allotSlots,
          ),
        ),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.ChangePasswordScreen(key: args.key),
        ),
      );
    },
    ChangeTherapistRoute.name: (routeData) {
      final args = routeData.argsAs<ChangeTherapistRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.ChangeTherapistScreen(
            key: args.key,
            allotSlots: args.allotSlots,
          ),
        ),
      );
    },
    CompletedSessionRoute.name: (routeData) {
      final args = routeData.argsAs<CompletedSessionRouteArgs>(
          orElse: () => const CompletedSessionRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.CompletedSessionScreen(key: args.key),
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.DashboardScreen(key: args.key),
        ),
      );
    },
    ExeApplyLeaveRoute.name: (routeData) {
      final args = routeData.argsAs<ExeApplyLeaveRouteArgs>(
          orElse: () => const ExeApplyLeaveRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.ExeApplyLeave(key: args.key),
        ),
      );
    },
    ExeLeaveStatusRoute.name: (routeData) {
      final args = routeData.argsAs<ExeLeaveStatusRouteArgs>(
          orElse: () => const ExeLeaveStatusRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.ExeLeaveStatusScreen(key: args.key),
        ),
      );
    },
    ExeTomorrowSessionRoute.name: (routeData) {
      final args = routeData.argsAs<ExeTomorrowSessionRouteArgs>(
          orElse: () => const ExeTomorrowSessionRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.ExeTomorrowSessionScreen(key: args.key),
        ),
      );
    },
    ExecutiveCancelledSessionRoute.name: (routeData) {
      final args = routeData.argsAs<ExecutiveCancelledSessionRouteArgs>(
          orElse: () => const ExecutiveCancelledSessionRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i11.loadLibrary,
          () => _i11.ExecutiveCancelledSessionScreen(key: args.key),
        ),
      );
    },
    ExecutiveCompletedSessionRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i12.loadLibrary,
          () => _i12.ExecutiveCompletedSessionScreen(),
        ),
      );
    },
    ExecutiveOngoingSessionRoute.name: (routeData) {
      final args = routeData.argsAs<ExecutiveOngoingSessionRouteArgs>(
          orElse: () => const ExecutiveOngoingSessionRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i13.loadLibrary,
          () => _i13.ExecutiveOngoingSessionScreen(key: args.key),
        ),
      );
    },
    LeaveStatusRoute.name: (routeData) {
      final args = routeData.argsAs<LeaveStatusRouteArgs>(
          orElse: () => const LeaveStatusRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i14.loadLibrary,
          () => _i14.LeaveStatusScreen(key: args.key),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i15.loadLibrary,
          () => _i15.LoginScreen(
            key: args.key,
            userType: args.userType,
          ),
        ),
      );
    },
    MobileNumberRoute.name: (routeData) {
      final args = routeData.argsAs<MobileNumberRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i16.loadLibrary,
          () => _i16.MobileNumberScreen(
            key: args.key,
            userType: args.userType,
          ),
        ),
      );
    },
    OnGoingSessionRoute.name: (routeData) {
      final args = routeData.argsAs<OnGoingSessionRouteArgs>(
          orElse: () => const OnGoingSessionRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i17.loadLibrary,
          () => _i17.OnGoingSessionScreen(key: args.key),
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i18.loadLibrary,
          () => _i18.ProfileScreen(),
        ),
      );
    },
    SessionReportRoute.name: (routeData) {
      final args = routeData.argsAs<SessionReportRouteArgs>(
          orElse: () => const SessionReportRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i19.loadLibrary,
          () => _i19.SessionReport(key: args.key),
        ),
      );
    },
    SessionRescheduleRoute.name: (routeData) {
      final args = routeData.argsAs<SessionRescheduleRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i20.loadLibrary,
          () => _i20.SessionRescheduleScreen(
            key: args.key,
            allotSlots: args.allotSlots,
          ),
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i21.loadLibrary,
          () => _i21.SplashScreen(),
        ),
      );
    },
    TomorrowSessionRoute.name: (routeData) {
      final args = routeData.argsAs<TomorrowSessionRouteArgs>(
          orElse: () => const TomorrowSessionRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i22.loadLibrary,
          () => _i22.TomorrowSessionScreen(key: args.key),
        ),
      );
    },
    UserTypeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i23.loadLibrary,
          () => _i23.UserTypeScreen(),
        ),
      );
    },
    VerifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyOtpRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DeferredWidget(
          _i24.loadLibrary,
          () => _i24.VerifyOtpScreen(
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
/// [_i1.AppLoadingDialog]
class LoadingDialogRoute extends _i25.PageRouteInfo<void> {
  const LoadingDialogRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LoadingDialogRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingDialogRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ApplyLeaveScreen]
class ApplyLeaveRoute extends _i25.PageRouteInfo<ApplyLeaveRouteArgs> {
  ApplyLeaveRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ApplyLeaveRoute.name,
          args: ApplyLeaveRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ApplyLeaveRoute';

  static const _i25.PageInfo<ApplyLeaveRouteArgs> page =
      _i25.PageInfo<ApplyLeaveRouteArgs>(name);
}

class ApplyLeaveRouteArgs {
  const ApplyLeaveRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ApplyLeaveRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CancelSessionScreen]
class CancelSessionRoute extends _i25.PageRouteInfo<CancelSessionRouteArgs> {
  CancelSessionRoute({
    _i26.Key? key,
    required _i27.AllotSlots allotSlots,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CancelSessionRoute.name,
          args: CancelSessionRouteArgs(
            key: key,
            allotSlots: allotSlots,
          ),
          initialChildren: children,
        );

  static const String name = 'CancelSessionRoute';

  static const _i25.PageInfo<CancelSessionRouteArgs> page =
      _i25.PageInfo<CancelSessionRouteArgs>(name);
}

class CancelSessionRouteArgs {
  const CancelSessionRouteArgs({
    this.key,
    required this.allotSlots,
  });

  final _i26.Key? key;

  final _i27.AllotSlots allotSlots;

  @override
  String toString() {
    return 'CancelSessionRouteArgs{key: $key, allotSlots: $allotSlots}';
  }
}

/// generated route for
/// [_i4.ChangePasswordScreen]
class ChangePasswordRoute extends _i25.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i25.PageInfo<ChangePasswordRouteArgs> page =
      _i25.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ChangeTherapistScreen]
class ChangeTherapistRoute
    extends _i25.PageRouteInfo<ChangeTherapistRouteArgs> {
  ChangeTherapistRoute({
    _i26.Key? key,
    required _i27.AllotSlots allotSlots,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ChangeTherapistRoute.name,
          args: ChangeTherapistRouteArgs(
            key: key,
            allotSlots: allotSlots,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangeTherapistRoute';

  static const _i25.PageInfo<ChangeTherapistRouteArgs> page =
      _i25.PageInfo<ChangeTherapistRouteArgs>(name);
}

class ChangeTherapistRouteArgs {
  const ChangeTherapistRouteArgs({
    this.key,
    required this.allotSlots,
  });

  final _i26.Key? key;

  final _i27.AllotSlots allotSlots;

  @override
  String toString() {
    return 'ChangeTherapistRouteArgs{key: $key, allotSlots: $allotSlots}';
  }
}

/// generated route for
/// [_i6.CompletedSessionScreen]
class CompletedSessionRoute
    extends _i25.PageRouteInfo<CompletedSessionRouteArgs> {
  CompletedSessionRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CompletedSessionRoute.name,
          args: CompletedSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CompletedSessionRoute';

  static const _i25.PageInfo<CompletedSessionRouteArgs> page =
      _i25.PageInfo<CompletedSessionRouteArgs>(name);
}

class CompletedSessionRouteArgs {
  const CompletedSessionRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'CompletedSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.DashboardScreen]
class DashboardRoute extends _i25.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i25.PageInfo<DashboardRouteArgs> page =
      _i25.PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ExeApplyLeave]
class ExeApplyLeaveRoute extends _i25.PageRouteInfo<ExeApplyLeaveRouteArgs> {
  ExeApplyLeaveRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ExeApplyLeaveRoute.name,
          args: ExeApplyLeaveRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExeApplyLeaveRoute';

  static const _i25.PageInfo<ExeApplyLeaveRouteArgs> page =
      _i25.PageInfo<ExeApplyLeaveRouteArgs>(name);
}

class ExeApplyLeaveRouteArgs {
  const ExeApplyLeaveRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ExeApplyLeaveRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ExeLeaveStatusScreen]
class ExeLeaveStatusRoute extends _i25.PageRouteInfo<ExeLeaveStatusRouteArgs> {
  ExeLeaveStatusRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ExeLeaveStatusRoute.name,
          args: ExeLeaveStatusRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExeLeaveStatusRoute';

  static const _i25.PageInfo<ExeLeaveStatusRouteArgs> page =
      _i25.PageInfo<ExeLeaveStatusRouteArgs>(name);
}

class ExeLeaveStatusRouteArgs {
  const ExeLeaveStatusRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ExeLeaveStatusRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.ExeTomorrowSessionScreen]
class ExeTomorrowSessionRoute
    extends _i25.PageRouteInfo<ExeTomorrowSessionRouteArgs> {
  ExeTomorrowSessionRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ExeTomorrowSessionRoute.name,
          args: ExeTomorrowSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExeTomorrowSessionRoute';

  static const _i25.PageInfo<ExeTomorrowSessionRouteArgs> page =
      _i25.PageInfo<ExeTomorrowSessionRouteArgs>(name);
}

class ExeTomorrowSessionRouteArgs {
  const ExeTomorrowSessionRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ExeTomorrowSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.ExecutiveCancelledSessionScreen]
class ExecutiveCancelledSessionRoute
    extends _i25.PageRouteInfo<ExecutiveCancelledSessionRouteArgs> {
  ExecutiveCancelledSessionRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ExecutiveCancelledSessionRoute.name,
          args: ExecutiveCancelledSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExecutiveCancelledSessionRoute';

  static const _i25.PageInfo<ExecutiveCancelledSessionRouteArgs> page =
      _i25.PageInfo<ExecutiveCancelledSessionRouteArgs>(name);
}

class ExecutiveCancelledSessionRouteArgs {
  const ExecutiveCancelledSessionRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ExecutiveCancelledSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.ExecutiveCompletedSessionScreen]
class ExecutiveCompletedSessionRoute extends _i25.PageRouteInfo<void> {
  const ExecutiveCompletedSessionRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ExecutiveCompletedSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExecutiveCompletedSessionRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ExecutiveOngoingSessionScreen]
class ExecutiveOngoingSessionRoute
    extends _i25.PageRouteInfo<ExecutiveOngoingSessionRouteArgs> {
  ExecutiveOngoingSessionRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ExecutiveOngoingSessionRoute.name,
          args: ExecutiveOngoingSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExecutiveOngoingSessionRoute';

  static const _i25.PageInfo<ExecutiveOngoingSessionRouteArgs> page =
      _i25.PageInfo<ExecutiveOngoingSessionRouteArgs>(name);
}

class ExecutiveOngoingSessionRouteArgs {
  const ExecutiveOngoingSessionRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ExecutiveOngoingSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.LeaveStatusScreen]
class LeaveStatusRoute extends _i25.PageRouteInfo<LeaveStatusRouteArgs> {
  LeaveStatusRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          LeaveStatusRoute.name,
          args: LeaveStatusRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LeaveStatusRoute';

  static const _i25.PageInfo<LeaveStatusRouteArgs> page =
      _i25.PageInfo<LeaveStatusRouteArgs>(name);
}

class LeaveStatusRouteArgs {
  const LeaveStatusRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'LeaveStatusRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i26.Key? key,
    required String userType,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<LoginRouteArgs> page =
      _i25.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.userType,
  });

  final _i26.Key? key;

  final String userType;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i16.MobileNumberScreen]
class MobileNumberRoute extends _i25.PageRouteInfo<MobileNumberRouteArgs> {
  MobileNumberRoute({
    _i26.Key? key,
    required String userType,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          MobileNumberRoute.name,
          args: MobileNumberRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'MobileNumberRoute';

  static const _i25.PageInfo<MobileNumberRouteArgs> page =
      _i25.PageInfo<MobileNumberRouteArgs>(name);
}

class MobileNumberRouteArgs {
  const MobileNumberRouteArgs({
    this.key,
    required this.userType,
  });

  final _i26.Key? key;

  final String userType;

  @override
  String toString() {
    return 'MobileNumberRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i17.OnGoingSessionScreen]
class OnGoingSessionRoute extends _i25.PageRouteInfo<OnGoingSessionRouteArgs> {
  OnGoingSessionRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          OnGoingSessionRoute.name,
          args: OnGoingSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnGoingSessionRoute';

  static const _i25.PageInfo<OnGoingSessionRouteArgs> page =
      _i25.PageInfo<OnGoingSessionRouteArgs>(name);
}

class OnGoingSessionRouteArgs {
  const OnGoingSessionRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'OnGoingSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SessionReport]
class SessionReportRoute extends _i25.PageRouteInfo<SessionReportRouteArgs> {
  SessionReportRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          SessionReportRoute.name,
          args: SessionReportRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SessionReportRoute';

  static const _i25.PageInfo<SessionReportRouteArgs> page =
      _i25.PageInfo<SessionReportRouteArgs>(name);
}

class SessionReportRouteArgs {
  const SessionReportRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'SessionReportRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.SessionRescheduleScreen]
class SessionRescheduleRoute
    extends _i25.PageRouteInfo<SessionRescheduleRouteArgs> {
  SessionRescheduleRoute({
    _i26.Key? key,
    required _i27.AllotSlots allotSlots,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          SessionRescheduleRoute.name,
          args: SessionRescheduleRouteArgs(
            key: key,
            allotSlots: allotSlots,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionRescheduleRoute';

  static const _i25.PageInfo<SessionRescheduleRouteArgs> page =
      _i25.PageInfo<SessionRescheduleRouteArgs>(name);
}

class SessionRescheduleRouteArgs {
  const SessionRescheduleRouteArgs({
    this.key,
    required this.allotSlots,
  });

  final _i26.Key? key;

  final _i27.AllotSlots allotSlots;

  @override
  String toString() {
    return 'SessionRescheduleRouteArgs{key: $key, allotSlots: $allotSlots}';
  }
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.TomorrowSessionScreen]
class TomorrowSessionRoute
    extends _i25.PageRouteInfo<TomorrowSessionRouteArgs> {
  TomorrowSessionRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          TomorrowSessionRoute.name,
          args: TomorrowSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TomorrowSessionRoute';

  static const _i25.PageInfo<TomorrowSessionRouteArgs> page =
      _i25.PageInfo<TomorrowSessionRouteArgs>(name);
}

class TomorrowSessionRouteArgs {
  const TomorrowSessionRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'TomorrowSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.UserTypeScreen]
class UserTypeRoute extends _i25.PageRouteInfo<void> {
  const UserTypeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.VerifyOtpScreen]
class VerifyOtpRoute extends _i25.PageRouteInfo<VerifyOtpRouteArgs> {
  VerifyOtpRoute({
    _i26.Key? key,
    required _i26.TextEditingController mobileNoController,
    required String userType,
    List<_i25.PageRouteInfo>? children,
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

  static const _i25.PageInfo<VerifyOtpRouteArgs> page =
      _i25.PageInfo<VerifyOtpRouteArgs>(name);
}

class VerifyOtpRouteArgs {
  const VerifyOtpRouteArgs({
    this.key,
    required this.mobileNoController,
    required this.userType,
  });

  final _i26.Key? key;

  final _i26.TextEditingController mobileNoController;

  final String userType;

  @override
  String toString() {
    return 'VerifyOtpRouteArgs{key: $key, mobileNoController: $mobileNoController, userType: $userType}';
  }
}

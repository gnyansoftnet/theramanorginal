import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';

class SplashServices {
  Future<void> isLogin(
      {required BuildContext context, required WidgetRef ref}) async {
    final isUserLogin =
        ref.watch(userProvider.select((value) => value?.isLogin));

    if (isUserLogin == false || isUserLogin == null) {
      Timer(const Duration(seconds: 3),
          () => context.router.replaceAll([const UserTypeRoute()]));
    } else {
      Timer(const Duration(seconds: 3),
          () => context.router.replaceAll([DashboardRoute()]));
    }
  }
}

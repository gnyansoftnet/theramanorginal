import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Preferences.getUser().then((value) {
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => context.router.replaceAll([const UserTypeRoute()]));
      } else {
        Timer(const Duration(seconds: 3),
            () => context.router.replaceAll([const HomeRoute()]));
      }
    });
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/splash/splash_service.dart';
import 'package:theraman/src/utils/constants/app_assets.dart';

@RoutePage(deferredLoading: true, name: "SplashRoute")
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SplashServices().isLogin(context: context, ref: ref);
    return const Scaffold(
      body: SafeArea(
        child: Center(
            child: Image(fit: BoxFit.cover, image: AssetImage(AppAssets.logo))),
      ),
    );
  }
}

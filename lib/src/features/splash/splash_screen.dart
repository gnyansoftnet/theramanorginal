import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/splash/splash_service.dart';
import 'package:theraman/src/utils/constants/app_assets.dart';

@RoutePage(deferredLoading: true, name: "SplashRoute")
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    return FutureBuilder(
        future: SplashServices().isLogin(context: context, ref: ref),
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
                child: Image(
                    height: height / 4,
                    fit: BoxFit.cover,
                    image: const AssetImage(AppAssets.logo))),
          );
        });
  }
}

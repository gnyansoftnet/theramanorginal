import 'package:device_preview/device_preview.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/auto_route_observer.dart';
import 'package:theraman/src/core/routes/router_pod.dart';
import 'package:theraman/src/core/theme/app_themes.dart';
import 'package:theraman/src/global/widgets/monitoring_connection_view.dart';

import 'src/global/helper/helper.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final approuter = ref.watch(autorouterProvider);
    return MaterialApp.router(
      title: 'Harmoney',
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: approuter.config(
        navigatorObservers: () => [
          RouterObserver(),
        ],
      ),
      builder: (context, child) {
        if (mounted) {
          child = DevicePreview.appBuilder(context, child);
          child = ResponsiveBreakPointWrapper(child: child);
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: child,
          );
        } else {
          child = const SizedBox.shrink();
        }
        return Toast(
          navigatorKey: navigatorKey,
          child: child,
        ).monitorConnection();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/auto_route_observer.dart';
import 'package:theraman/src/core/routes/router_pod.dart';
import 'package:theraman/src/core/theme/app_themes.dart';
import 'package:theraman/src/global/widgets/monitoring_connection_view.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        ).monitorConnection();
      },
    );
  }
}

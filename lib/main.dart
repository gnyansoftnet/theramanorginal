import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/theme/app_themes.dart';
import 'package:theraman/src/global/widgets/monitoring_connection_view.dart';
import 'src/core/routes/auto_route_observer.dart';
import 'src/core/routes/router_pod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approuter = ref.watch(autorouterProvider);
    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: approuter.config(
        navigatorObservers: () => [
          RouterObserver(),
        ],
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: child,
        ).monitorConnection();
      },
    );
  }
}

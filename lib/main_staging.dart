import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/app.dart';
import 'package:theraman/src/global/helper/app_talker.dart';
import 'package:theraman/src/global/helper/riverpod_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDisplayMode.setHighRefreshRate();
  runApp(
    ProviderScope(
        overrides: const [],
        observers: [RiverpodObserverLogger(talker: talker)],
        child: DevicePreview(
            enabled: true,
            tools: const [
              ...DevicePreview.defaultTools,
            ],
            builder: (context) => const App())),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
}

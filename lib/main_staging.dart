import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:theraman/app.dart';
import 'package:theraman/init.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';

import 'src/global/helper/helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(init());
  final directory = await getApplicationCacheDirectory();
  await Hive.initFlutter(directory.path);
  await Hive.initFlutter();
  final userBox = await Hive.openBox('userBox');
  runApp(
    ProviderScope(
        overrides: [
          userBoxProvider.overrideWithValue(userBox),
        ],
        observers: [
          RiverpodObserverLogger(talker: talker)
        ],
        child: DevicePreview(
            enabled: true,
            tools: const [
              ...DevicePreview.defaultTools,
            ],
            builder: (context) => const App())),
  );
}

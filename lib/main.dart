import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
}

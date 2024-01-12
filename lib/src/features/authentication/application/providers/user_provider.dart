import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:theraman/src/features/authentication/application/notifiers/user_notifier.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';

final userBoxProvider = Provider.autoDispose<Box>(
  (ref) => throw UnimplementedError("appBoxProvider is not overriden"),
  name: 'userBoxProvider',
);

final userProvider = AutoDisposeNotifierProvider<UserNotifier, UserModel?>(
  () => UserNotifier(),
  name: "userProvide",
);

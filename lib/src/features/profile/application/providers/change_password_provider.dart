import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/profile/application/notifiers/change_password_notifier.dart';
import 'package:theraman/src/features/profile/application/states/change_password_state.dart';

final changePasswordPod = AutoDisposeAsyncNotifierProvider<
    ChangePasswordNotifier,
    ChangePasswordState>(() => ChangePasswordNotifier());

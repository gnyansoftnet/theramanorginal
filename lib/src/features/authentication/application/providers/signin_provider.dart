import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/signin_notifier.dart';
import 'package:theraman/src/features/authentication/application/states/signin_state.dart';

final signinProvider =
    AutoDisposeAsyncNotifierProvider<SigninNotifier, SigninState>(
        () => SigninNotifier());

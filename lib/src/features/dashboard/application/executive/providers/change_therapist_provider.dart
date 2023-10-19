import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/notifiers/change_therapist_notifier.dart';
import 'package:theraman/src/features/dashboard/application/executive/states/change_therapist_state.dart';

final changeTherapistProvider = AutoDisposeAsyncNotifierProvider<
    ChangeTherapistNotifier,
    ChangeTherapistState>(() => ChangeTherapistNotifier());

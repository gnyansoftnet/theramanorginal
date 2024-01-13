import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/notifier/change_therapist_notifier.dart';
import 'package:theraman/src/features/executive/application/states/change_therapist_state.dart';

final changeTherapistProvider = AutoDisposeAsyncNotifierProvider<
    ChangeTherapistNotifier,
    ChangeTherapistState>(() => ChangeTherapistNotifier());

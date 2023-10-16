import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:theraman/src/global/pod/internet_checker_pod.dart';

class InternetStatusNotifier extends AutoDisposeStreamNotifier<InternetStatus> {
  @override
  Stream<InternetStatus> build() {
    final enabled = ref.watch(enableInternetCheckerPod);
    if (enabled) {
      final statusChange =
          ref.watch(internetConnectionCheckerPod).onStatusChange;
      return statusChange.distinct();
    } else {
      return Stream.value(InternetStatus.connected);
    }
  }

  @visibleForTesting
  void change({required InternetStatus status}) {
    state = AsyncData(status);
  }
}

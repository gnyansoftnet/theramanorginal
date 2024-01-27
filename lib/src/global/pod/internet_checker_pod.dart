import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:theraman/src/global/pod/internet_status.notifier.dart';

/// A flag provider to disable or enable internet checker
final enableInternetCheckerPod = Provider.autoDispose<bool>((ref) {
  return true;
});

/// stream provider of internet status
final internetCheckerPod =
    StreamNotifierProvider.autoDispose<InternetStatusNotifier, InternetStatus>(
        InternetStatusNotifier.new);

/// GIve the instatnce of internet connection class
final internetConnectionCheckerPod =
    Provider.autoDispose<InternetConnection>((ref) {
  return InternetConnection.createInstance(
    checkInterval: const Duration(seconds: 5),
  );
});

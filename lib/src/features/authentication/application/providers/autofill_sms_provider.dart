import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/autofill_sms_notifiers.dart';

final autoFillSmsProvider =
    StateNotifierProvider.autoDispose<AutoFillSmsNotifier, String?>(
        (ref) => AutoFillSmsNotifier());

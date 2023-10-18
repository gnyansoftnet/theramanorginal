import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/cancel_session_provider.dart';

class CancelSessionController {
  void cancelSession(
      {required WidgetRef ref,
      required int slotId,
      required String reason,
      required String isAdjustable}) async {
    ref.read(cancelSessionProvider.notifier).cancelSession(
        slotId: slotId, isAdjustable: isAdjustable, reason: reason);
  }
}

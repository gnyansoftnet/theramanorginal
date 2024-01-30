import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/provider/completed_slot_all_therapist.provider.dart';
import 'package:theraman/src/features/executive/presentation/widget/completed_listview.dart';
import 'package:theraman/src/global/widgets/empty_widget.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveCompletedSessionRoute")
class ExecutiveCompletedSessionScreen extends ConsumerWidget {
  const ExecutiveCompletedSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedSessionState = ref.watch(completedSlotAllTherapistProvider);
    return Scaffold(
      body: completedSessionState.easyWhen(onRetry: () {
        ref.invalidate(completedSlotAllTherapistProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(completedSlotAllTherapistProvider);
            },
            child: value.allotSlots!.isEmpty
                ? EmptyWidget(onPressed: () {
                    ref.invalidate(completedSlotAllTherapistProvider);
                  })
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return CompletedListView(data: data);
                    }),
          ),
        );
      }),
    );
  }
}

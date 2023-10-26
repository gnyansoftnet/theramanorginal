import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/completed_slot_all_therapist.provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/completed_listview.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

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
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/images/svg/blank.svg",
                            fit: BoxFit.cover,
                            height: MediaQuery.sizeOf(context).height / 3,
                          ),
                        ),
                        gapH8,
                        ElevatedButton(
                            onPressed: () {
                              ref.invalidate(completedSlotAllTherapistProvider);
                            },
                            child: const Text("Retry"))
                      ],
                    ),
                  )
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

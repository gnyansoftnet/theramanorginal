import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/cancelled_slot_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/cancelled_listview.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveCancelledSessionRoute")
class ExecutiveCancelledSessionScreen extends ConsumerWidget {
  const ExecutiveCancelledSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cancelledSlotState = ref.watch(cancelledSlotProvider);
    return Scaffold(
      body: cancelledSlotState.easyWhen(onRetry: () {
        ref.invalidate(cancelledSlotProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(cancelledSlotProvider);
            },
            child: value.allotSlots!.isEmpty
                ? Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/svg/blank.svg",
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                      ),
                      gapH8,
                      ElevatedButton(
                          onPressed: () {
                            ref.invalidate(cancelledSlotProvider);
                          },
                          child: const Text("Retry"))
                    ],
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return CancelledListView(data: data);
                    }),
          ),
        );
      }),
    );
  }
}

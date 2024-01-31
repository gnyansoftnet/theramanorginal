import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/provider/cancelled_slot_provider.dart';
import 'package:theraman/src/features/executive/presentation/controller/e_dashboard_controller.dart';
import 'package:theraman/src/global/widgets/empty_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveCancelledSessionRoute")
class ExecutiveCancelledSessionScreen extends ConsumerWidget {
  ExecutiveCancelledSessionScreen({super.key});
  final edashBoardController = EDashboardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cancelledSlotState = ref.watch(cancelledSlotProvider);
    return Scaffold(
      body: cancelledSlotState.easyWhen(onRetry: () {
        ref.invalidate(cancelledSlotProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(cancelledSlotProvider);
            },
            child: value.allotSlots!.isEmpty
                ? EmptyWidget(onPressed: () {
                    ref.invalidate(cancelledSlotProvider);
                  })
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return Card(
                        elevation: 1.0,
                        margin: EdgeInsets.zero,
                        color: AppColors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${data.rSPName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color:
                                                  Theme.of(context).cardColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  PopupMenuButton(
                                    color: Theme.of(context).cardColor,
                                    iconColor: Theme.of(context).cardColor,
                                    itemBuilder: (context) =>
                                        <PopupMenuEntry<String>>[
                                      PopupMenuItem(
                                          child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          edashBoardController
                                              .resumeCancelledSession(
                                                  context: context,
                                                  ref: ref,
                                                  slotId: data.rSSlotId ?? 0);
                                        },
                                        dense: true,
                                        visualDensity:
                                            const VisualDensity(vertical: -4),
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(Icons.restore),
                                        title: const Text("Resume Session"),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                              gap8,
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${data.rSSlotType}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color:
                                                    Theme.of(context).cardColor,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "${data.rSSessionType}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color:
                                                  Theme.of(context).cardColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                              gap8,
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data.rSStartTime}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color:
                                                  Theme.of(context).cardColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${data.rSDoctorName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color:
                                                  Theme.of(context).cardColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                              gap8,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data.rSReason}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color:
                                                  Theme.of(context).cardColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      );
                    }),
          ),
        );
      }),
    );
  }
}

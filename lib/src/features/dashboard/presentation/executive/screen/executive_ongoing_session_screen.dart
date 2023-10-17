import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/alloted_slot_all_therapist_provider.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveOngoingSessionRoute")
class ExecutiveOngoingSessionScreen extends ConsumerWidget {
  const ExecutiveOngoingSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(allotedSlotAllTherapistProvider);
    return Scaffold(
      body: allotedSlotState.easyWhen(onRetry: () {
        ref.invalidate(allotedSlotAllTherapistProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(allotedSlotAllTherapistProvider);
            },
            child: value.allotSlots!.isEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          "assets/images/svg/blank.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      gapH8,
                      const Expanded(
                          child: Text(
                        "You do not have any alloted slot",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return Card(
                        elevation: 5.0,
                        color: data.rSSlotStatus == "Started"
                            ? AppColors.blue
                            : AppColors.cyan,
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.only(right: 0, left: 14),
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -3),
                              leading: Text(
                                "${data.rSPName}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              trailing: PopupMenuButton(
                                color: AppColors.white,
                                itemBuilder: (context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem(
                                      child: ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: Icon(Icons.change_circle),
                                    title: Text("Session Reschedule"),
                                  )),
                                  const PopupMenuItem(
                                      child: ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: Icon(Icons.group),
                                    title: Text("Change Therapist"),
                                  )),
                                  PopupMenuItem(
                                      child: ListTile(
                                    onTap: () {
                                      context.navigateTo(
                                          CancelSessionRoute(allotSlots: data));
                                    },
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: const Icon(Icons.cancel),
                                    title: const Text(" Session Cancellation"),
                                  )),
                                ],
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -3),
                              leading: Text(
                                "${data.rSSlotType}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                              trailing: Text(
                                "${data.rSSessionType}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -1),
                              leading: Text(
                                "${data.rSStartTime}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              trailing: Text(
                                "${data.rSDoctorName}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
          ),
        );
      }),
    );
  }
}

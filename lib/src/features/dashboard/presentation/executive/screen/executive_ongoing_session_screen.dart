import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/alloted_slot_all_therapist_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/clock_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/common_ext/alert_dialog_ext.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveOngoingSessionRoute")
class ExecutiveOngoingSessionScreen extends ConsumerWidget {
  ExecutiveOngoingSessionScreen({super.key});

  final eDashboardControlller = EDashboardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(allotedSlotAllTherapistProvider);
    final clockState = ref.watch(clockProvider);
    final time = DateFormat("yyyy-dd-MM HH:mm").format(clockState);

    return Scaffold(
      body: allotedSlotState.easyWhen(onRetry: () {
        ref.invalidate(allotedSlotAllTherapistProvider);
      }, data: (value) {
        // debugPrint("Time===$time");
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(allotedSlotAllTherapistProvider);
            },
            child: value.allotSlots!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/blank.svg",
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).height / 3,
                        ),
                        gapH8,
                        const Text("Ohh ! here is no slot available"),
                        gapH8,
                        ElevatedButton(
                            onPressed: () {
                              ref.invalidate(allotedSlotAllTherapistProvider);
                            },
                            child: const Text("Refresh"))
                      ],
                    ),
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
                            : data.rSSessionType == "Adjustment"
                                ? AppColors.teal
                                : data.rSActionStatus == "Rescheduled"
                                    ? const Color(0xffb467ed)
                                    : data.rSActionStatus == "Change Therapist"
                                        ? Colors.orange
                                        : AppColors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 5, left: 10, right: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${data.rSPName}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  PopupMenuButton(
                                    color: AppColors.white,
                                    itemBuilder: (context) =>
                                        <PopupMenuEntry<String>>[
                                      PopupMenuItem(
                                          child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          context.navigateTo(
                                              SessionRescheduleRoute(
                                                  allotSlots: data));
                                        },
                                        dense: true,
                                        visualDensity:
                                            const VisualDensity(vertical: -4),
                                        contentPadding: EdgeInsets.zero,
                                        leading:
                                            const Icon(Icons.change_circle),
                                        title: const Text("Session Reschedule"),
                                      )),
                                      PopupMenuItem(
                                          child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          context.navigateTo(
                                              ChangeTherapistRoute(
                                                  allotSlots: data));
                                        },
                                        dense: true,
                                        visualDensity:
                                            const VisualDensity(vertical: -4),
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(Icons.group),
                                        title: const Text("Change Therapist"),
                                      )),
                                      PopupMenuItem(
                                          child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          context.navigateTo(CancelSessionRoute(
                                              allotSlots: data));
                                        },
                                        dense: true,
                                        visualDensity:
                                            const VisualDensity(vertical: -4),
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(Icons.cancel),
                                        title:
                                            const Text(" Session Cancellation"),
                                      )),
                                      PopupMenuItem(
                                          child: ListTile(
                                        onTap: data.rSSlotStatus != "Started"
                                            ? () {
                                                Navigator.pop(context);

                                                final currTime =
                                                    DateTime.parse(time);

                                                final slotTime = DateFormat(
                                                        'yyyy-dd-MM HH:mm')
                                                    .parse(data.slotStartTime!);

                                                final duration = slotTime
                                                    .subtract(const Duration(
                                                        minutes: 10))
                                                    .compareTo(
                                                        currTime.subtract(
                                                            const Duration(
                                                                minutes: 10)));
                                                final difference = slotTime
                                                    .difference(currTime);

                                                if (duration == -1 ||
                                                    duration == 0) {
                                                  eDashboardControlller
                                                      .exeStartSession(
                                                          context: context,
                                                          ref: ref,
                                                          slotId:
                                                              data.rSSlotId ??
                                                                  0)
                                                      .then((value) {})
                                                      .onError(
                                                          (error, stackTrace) {
                                                    context.showSnackBar(SnackBar(
                                                        content: Text(
                                                            "$error something went wrong !")));
                                                  });
                                                } else if (duration == 1 &&
                                                        difference ==
                                                            const Duration(
                                                                minutes: 1) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 2) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 3) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 4) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 5) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 6) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 7) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 8) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 9) ||
                                                    difference ==
                                                        const Duration(
                                                            minutes: 10)) {
                                                  eDashboardControlller
                                                      .exeStartSession(
                                                          context: context,
                                                          ref: ref,
                                                          slotId:
                                                              data.rSSlotId ??
                                                                  0)
                                                      .then((value) {})
                                                      .onError(
                                                          (error, stackTrace) {
                                                    context.showSnackBar(SnackBar(
                                                        content: Text(
                                                            "$error something went wrong !")));
                                                  });
                                                } else {
                                                  context.showCustomDialog(
                                                      builder: (ctx) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          "Warning !"),
                                                      content: const Text(
                                                          "You will start the session before 10 minutes"),
                                                      actions: [
                                                        TextButton(
                                                            child: const Text(
                                                                "OK"),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  ctx);
                                                            })
                                                      ],
                                                    );
                                                  });
                                                }
                                              }
                                            : () {
                                                Navigator.pop(context);
                                                eDashboardControlller
                                                    .exeCompleteSession(
                                                        context: context,
                                                        ref: ref,
                                                        slotId:
                                                            data.rSSlotId ?? 0)
                                                    .then((value) {})
                                                    .onError(
                                                        (error, stackTrace) {
                                                  context.showSnackBar(SnackBar(
                                                      content: Text(
                                                          "$error something went wrong !")));
                                                });
                                              },
                                        dense: true,
                                        visualDensity:
                                            const VisualDensity(vertical: -4),
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(Icons.done),
                                        title: Text(
                                            data.rSSlotStatus != "Started"
                                                ? "Start Session"
                                                : "Complete Session"),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                              gapH4,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${data.rSSlotType}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    "${data.rSSessionType}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                              gapH8,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${data.rSStartTime}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "${data.rSSlotStatus}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              gapH8,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.rSDoctorName}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
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

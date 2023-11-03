import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/clock_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/common_ext/alert_dialog_ext.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';

class CustomOngoingSearch extends SearchDelegate {
  final List<AllotSlots>? allotSlots;
  CustomOngoingSearch({required this.allotSlots});
  final eDashboardController = EDashboardController();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<AllotSlots> matchQuery = [];

    for (var slot in allotSlots!) {
      if (slot.rSDoctorName!.toLowerCase().contains(query.toLowerCase()) ||
          slot.rSPName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(slot);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer(builder: (context, ref, child) {
        final clockState = ref.watch(clockProvider);
        final time = DateFormat("yyyy-dd-MM HH:mm").format(clockState);
        return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              final data = matchQuery[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    context.navigateTo(SessionRescheduleRoute(
                                        allotSlots: data));
                                  },
                                  dense: true,
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.change_circle),
                                  title: const Text("Session Reschedule"),
                                )),
                                PopupMenuItem(
                                    child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    context.navigateTo(
                                        ChangeTherapistRoute(allotSlots: data));
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
                                PopupMenuItem(
                                    child: ListTile(
                                  onTap: data.rSSlotStatus != "Started"
                                      ? () {
                                          Navigator.pop(context);
                                          debugPrint("time===$time");
                                          final currTime = DateTime.parse(time);
                                          debugPrint(
                                              "currentTime=== $currTime");
                                          debugPrint(
                                              "currentTimen type=== ${currTime.runtimeType}");
                                          final slotTime =
                                              DateFormat('yyyy-dd-MM HH:mm')
                                                  .parse(data.slotStartTime!);
                                          debugPrint("slot time=== $slotTime");
                                          debugPrint(
                                              "slot time=== ${slotTime.runtimeType}");
                                          final duration = slotTime
                                              .subtract(
                                                  const Duration(minutes: 10))
                                              .compareTo(currTime.subtract(
                                                  const Duration(minutes: 10)));
                                          final difference =
                                              slotTime.difference(currTime);
                                          debugPrint("duration=== $duration");
                                          debugPrint(
                                              "difference=== $difference");

                                          if (duration == -1 || duration == 0) {
                                            eDashboardController
                                                .exeStartSession(
                                                    context: context,
                                                    ref: ref,
                                                    slotId: data.rSSlotId ?? 0)
                                                .then((value) {})
                                                .onError(
                                                    (error, stackTrace) {});
                                          } else if (duration == 1 &&
                                                  difference ==
                                                      const Duration(
                                                          minutes: 1) ||
                                              difference ==
                                                  const Duration(minutes: 2) ||
                                              difference ==
                                                  const Duration(minutes: 3) ||
                                              difference ==
                                                  const Duration(minutes: 4) ||
                                              difference ==
                                                  const Duration(minutes: 5) ||
                                              difference ==
                                                  const Duration(minutes: 6) ||
                                              difference ==
                                                  const Duration(minutes: 7) ||
                                              difference ==
                                                  const Duration(minutes: 8) ||
                                              difference ==
                                                  const Duration(minutes: 9) ||
                                              difference ==
                                                  const Duration(minutes: 10)) {
                                            eDashboardController
                                                .exeStartSession(
                                                    context: context,
                                                    ref: ref,
                                                    slotId: data.rSSlotId ?? 0)
                                                .then((value) {})
                                                .onError(
                                                    (error, stackTrace) {});
                                          } else {
                                            context.showCustomDialog(
                                                builder: (ctx) {
                                              return AlertDialog(
                                                title: const Text("Warning !"),
                                                content: const Text(
                                                    "You will start the session before 10 minutes"),
                                                actions: [
                                                  TextButton(
                                                      child: const Text("OK"),
                                                      onPressed: () {
                                                        Navigator.pop(ctx);
                                                      })
                                                ],
                                              );
                                            });
                                          }
                                        }
                                      : () {
                                          Navigator.pop(context);
                                          eDashboardController
                                              .exeCompleteSession(
                                                  context: context,
                                                  ref: ref,
                                                  slotId: data.rSSlotId ?? 0)
                                              .then((value) {})
                                              .onError((error, stackTrace) {
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
                                  title: Text(data.rSSlotStatus != "Started"
                                      ? "Start Session"
                                      : "Complete Session"),
                                )),
                              ],
                            ),
                          ],
                        ),
                        gapH4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              );
            });
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<AllotSlots> matchQuery = [];

    for (var slot in allotSlots!) {
      if (slot.rSDoctorName!.toLowerCase().contains(query.toLowerCase()) ||
          slot.rSPName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(slot);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer(builder: (context, ref, child) {
        final clockState = ref.watch(clockProvider);
        final time = DateFormat("yyyy-dd-MM HH:mm").format(clockState);
        return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              final data = matchQuery[index];
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            itemBuilder: (context) => <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                  child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  context.navigateTo(
                                      SessionRescheduleRoute(allotSlots: data));
                                },
                                dense: true,
                                visualDensity:
                                    const VisualDensity(vertical: -4),
                                contentPadding: EdgeInsets.zero,
                                leading: const Icon(Icons.change_circle),
                                title: const Text("Session Reschedule"),
                              )),
                              PopupMenuItem(
                                  child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  context.navigateTo(
                                      ChangeTherapistRoute(allotSlots: data));
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
                              PopupMenuItem(
                                  child: ListTile(
                                onTap: data.rSSlotStatus != "Started"
                                    ? () {
                                        Navigator.pop(context);
                                        debugPrint("time===$time");
                                        final currTime = DateTime.parse(time);
                                        debugPrint("currentTime=== $currTime");
                                        debugPrint(
                                            "currentTimen type=== ${currTime.runtimeType}");
                                        final slotTime =
                                            DateFormat('yyyy-dd-MM HH:mm')
                                                .parse(data.slotStartTime!);
                                        debugPrint("slot time=== $slotTime");
                                        debugPrint(
                                            "slot time=== ${slotTime.runtimeType}");
                                        final duration = slotTime
                                            .subtract(
                                                const Duration(minutes: 10))
                                            .compareTo(currTime.subtract(
                                                const Duration(minutes: 10)));
                                        final difference =
                                            slotTime.difference(currTime);
                                        debugPrint("duration=== $duration");
                                        debugPrint("difference=== $difference");

                                        if (duration == -1 || duration == 0) {
                                          eDashboardController
                                              .exeStartSession(
                                                  context: context,
                                                  ref: ref,
                                                  slotId: data.rSSlotId ?? 0)
                                              .then((value) {})
                                              .onError((error, stackTrace) {});
                                        } else if (duration == 1 &&
                                                difference ==
                                                    const Duration(
                                                        minutes: 1) ||
                                            difference ==
                                                const Duration(minutes: 2) ||
                                            difference ==
                                                const Duration(minutes: 3) ||
                                            difference ==
                                                const Duration(minutes: 4) ||
                                            difference ==
                                                const Duration(minutes: 5) ||
                                            difference ==
                                                const Duration(minutes: 6) ||
                                            difference ==
                                                const Duration(minutes: 7) ||
                                            difference ==
                                                const Duration(minutes: 8) ||
                                            difference ==
                                                const Duration(minutes: 9) ||
                                            difference ==
                                                const Duration(minutes: 10)) {
                                          eDashboardController
                                              .exeStartSession(
                                                  context: context,
                                                  ref: ref,
                                                  slotId: data.rSSlotId ?? 0)
                                              .then((value) {})
                                              .onError((error, stackTrace) {});
                                        } else {
                                          context.showCustomDialog(
                                              builder: (ctx) {
                                            return AlertDialog(
                                              title: const Text("Warning !"),
                                              content: const Text(
                                                  "You will start the session before 10 minutes"),
                                              actions: [
                                                TextButton(
                                                    child: const Text("OK"),
                                                    onPressed: () {
                                                      Navigator.pop(ctx);
                                                    })
                                              ],
                                            );
                                          });
                                        }
                                      }
                                    : () {
                                        Navigator.pop(context);
                                        eDashboardController
                                            .exeCompleteSession(
                                                context: context,
                                                ref: ref,
                                                slotId: data.rSSlotId ?? 0)
                                            .then((value) {})
                                            .onError((error, stackTrace) {
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
                                title: Text(data.rSSlotStatus != "Started"
                                    ? "Start Session"
                                    : "Complete Session"),
                              )),
                            ],
                          ),
                        ],
                      ),
                      gapH4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            });
      }),
    );
  }
}

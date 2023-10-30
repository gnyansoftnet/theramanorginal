import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
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
      child: ListView.builder(
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
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(right: 0, left: 14),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
                      leading: Text(
                        "${data.rSPName}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      trailing: Consumer(builder: (context, ref, _) {
                        return PopupMenuButton(
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
                              visualDensity: const VisualDensity(vertical: -4),
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
                              visualDensity: const VisualDensity(vertical: -4),
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
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.cancel),
                              title: const Text(" Session Cancellation"),
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              onTap: data.rSSlotStatus != "Started"
                                  ? () async {
                                      Navigator.pop(context);
                                      await eDashboardController
                                          .exeStartSession(
                                              context: context,
                                              ref: ref,
                                              slotId: data.rSSlotId ?? 0)
                                          .then((value) {
                                        if (value! && context.mounted) {
                                          close(context, null);
                                        }
                                      }).onError((error, stackTrace) {
                                        // context.showSnackBar(SnackBar(
                                        //     content: Text(
                                        //         "$error something went wrong !")));
                                      });
                                    }
                                  : () async {
                                      Navigator.pop(context);
                                      await eDashboardController
                                          .exeCompleteSession(
                                              context: context,
                                              ref: ref,
                                              slotId: data.rSSlotId ?? 0)
                                          .then((value) {
                                        if (value! && context.mounted) {
                                          close(context, null);
                                        }
                                      }).onError((error, stackTrace) {
                                        // context.showSnackBar(SnackBar(
                                        //     content: Text(
                                        //         "$error something went wrong !")));
                                      });
                                    },
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.done),
                              title: Text(data.rSSlotStatus != "Started"
                                  ? "Start Session"
                                  : "Complete Session"),
                            )),
                          ],
                        );
                      }),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
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
                      visualDensity: const VisualDensity(vertical: -4),
                      leading: Text(
                        "${data.rSStartTime}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      trailing: Text(
                        "${data.rSSlotStatus}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
                      leading: Text(
                        "${data.rSDoctorName}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            );
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
      child: ListView.builder(
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
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(right: 0, left: 14),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: Text(
                      "${data.rSPName}",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    trailing: Consumer(builder: (context, ref, _) {
                      return PopupMenuButton(
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
                            visualDensity: const VisualDensity(vertical: -4),
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
                            visualDensity: const VisualDensity(vertical: -4),
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
                            visualDensity: const VisualDensity(vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.cancel),
                            title: const Text(" Session Cancellation"),
                          )),
                          PopupMenuItem(
                              child: ListTile(
                            onTap: data.rSSlotStatus != "Started"
                                ? () async {
                                    Navigator.pop(context);
                                    await eDashboardController
                                        .exeStartSession(
                                            context: context,
                                            ref: ref,
                                            slotId: data.rSSlotId ?? 0)
                                        .then((value) {
                                      if (value! && context.mounted) {
                                        close(context, null);
                                      }
                                    }).onError((error, stackTrace) {
                                      // context.showSnackBar(SnackBar(
                                      //     content: Text(
                                      //         "$error something went wrong !")));
                                    });
                                  }
                                : () async {
                                    Navigator.pop(context);
                                    await eDashboardController
                                        .exeCompleteSession(
                                            context: context,
                                            ref: ref,
                                            slotId: data.rSSlotId ?? 0)
                                        .then((value) {
                                      if (value! && context.mounted) {
                                        close(context, null);
                                      }
                                    }).onError((error, stackTrace) {
                                      // context.showSnackBar(SnackBar(
                                      //     content: Text(
                                      //         "$error something went wrong")));
                                    });
                                  },
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.done),
                            title: Text(data.rSSlotStatus != "Started"
                                ? "Start Session"
                                : "Complete Session"),
                          )),
                        ],
                      );
                    }),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
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
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: Text(
                      "${data.rSStartTime}",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    trailing: Text(
                      "${data.rSSlotStatus}",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: Text(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/cancelled_listview.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';

class CustomCancelledSearch extends SearchDelegate {
  final List<AllotSlots>? allotSlots;
  CustomCancelledSearch({required this.allotSlots});

  final edashBoardController = EDashboardController();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
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
            return Card(
              elevation: 5.0,
              color: AppColors.red,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(right: 0, left: 14),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
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
                            onTap: () async {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              await edashBoardController
                                  .resumeCancelledSession(
                                      context: context,
                                      ref: ref,
                                      slotId: data.rSSlotId ?? 0)
                                  .then((value) {
                                if (value! && context.mounted) {
                                  close(context, null);
                                }
                              }).onError((error, stackTrace) => null);
                            },
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.restore),
                            title: const Text("Resume Session"),
                          )),
                        ],
                      );
                    }),
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
                    visualDensity: const VisualDensity(vertical: -3),
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
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(
                      "${data.rSReason}",
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
              color: AppColors.red,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(right: 0, left: 14),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
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
                            onTap: () async {
                              Navigator.pop(context);
                              await edashBoardController
                                  .resumeCancelledSession(
                                      context: context,
                                      ref: ref,
                                      slotId: data.rSSlotId ?? 0)
                                  .then((value) {
                                if (value! && context.mounted) {
                                  close(context, null);
                                }
                              }).onError((error, stackTrace) => null);
                            },
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.restore),
                            title: const Text("Resume Session"),
                          )),
                        ],
                      );
                    }),
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
                    visualDensity: const VisualDensity(vertical: -3),
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
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(
                      "${data.rSReason}",
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

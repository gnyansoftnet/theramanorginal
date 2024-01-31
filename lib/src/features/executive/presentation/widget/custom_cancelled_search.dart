import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/presentation/controller/e_dashboard_controller.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

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
                        Consumer(builder: (context, ref, child) {
                          return PopupMenuButton(
                            color: Theme.of(context).cardColor,
                            iconColor: Theme.of(context).cardColor,
                            itemBuilder: (context) => <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                  child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  edashBoardController.resumeCancelledSession(
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
                          );
                        }),
                      ],
                    ),
                    gap8,
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
                        ]),
                    gap8,
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
                            "${data.rSDoctorName}",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ]),
                    gap8,
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "${data.rSReason}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ])
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
              color: AppColors.red,
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
                        Consumer(builder: (context, ref, _) {
                          return PopupMenuButton(
                            color: Theme.of(context).cardColor,
                            iconColor: Theme.of(context).cardColor,
                            itemBuilder: (context) => <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                  child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  edashBoardController.resumeCancelledSession(
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
                          );
                        }),
                      ],
                    ),
                    gap8,
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
                        ]),
                    gap8,
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
                            "${data.rSDoctorName}",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ]),
                    gap8,
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "${data.rSReason}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ])
                  ],
                ),
              ),
            );
          }),
    );
  }
}

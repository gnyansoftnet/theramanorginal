import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/alloted_slot_all_therapist_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_cancelled_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_ongoing_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/ongoing_session_screen.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/global/pod/check_user_type_pod.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTypeState = ref.watch(checkUserTypePod);
    final allotSlotState = ref.watch(allotedSlotAllTherapistProvider);
    return DefaultTabController(
      length: userTypeState.value == "T" ? 2 : 3,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("DashBoard"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: allotSlotState.when(
                              data: (value) =>
                                  CustomSearch(allotSlots: value.allotSlots),
                              error: (_, __) => CustomSearch(allotSlots: []),
                              loading: () => CustomSearch(allotSlots: []),
                            ));
                      },
                      icon: const Icon(
                        Icons.search,
                        // size: 25,
                      )),
                )
              ],
              bottom: TabBar(
                  tabs: userTypeState.value == "T"
                      ? [
                          const Tab(
                            child: Text(
                              "ONGOING",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Tab(
                            child: Text(
                              "COMPLETED",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ]
                      : [
                          const Tab(
                            child: Text(
                              "ONGOING",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Tab(
                            child: Text(
                              "COMPLETED",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Tab(
                            child: Text(
                              "CANCELLED",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ])),
          drawer: const DrawerWidget(currentPage: "DashboardRoute"),
          body: TabBarView(
            children: userTypeState.value == "T"
                ? [OnGoingSessionScreen(), CompletedSessionScreen()]
                : [
                    const ExecutiveOngoingSessionScreen(),
                    const ExecutiveCompletedSessionScreen(),
                    const ExecutiveCancelledSessionScreen(),
                  ],
          )),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final List<AllotSlots>? allotSlots;
  CustomSearch({required this.allotSlots});

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
            return Card(
              elevation: 5.0,
              color: data.rSSlotStatus == "Started"
                  ? AppColors.blue
                  : AppColors.cyan,
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
                    trailing: PopupMenuButton(
                      color: AppColors.white,
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
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
                            // context.navigateTo(
                            // CancelSessionRoute(allotSlots: data));
                          },
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -4),
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
                  : AppColors.cyan,
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
                    trailing: PopupMenuButton(
                      color: AppColors.white,
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
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
                            // context.navigateTo(
                            // CancelSessionRoute(allotSlots: data));
                          },
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -4),
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
    );
  }
}

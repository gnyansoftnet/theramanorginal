import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_cancelled_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_ongoing_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/ongoing_session_screen.dart';
import 'package:theraman/src/global/pod/check_user_type_pod.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTypeState = ref.watch(checkUserTypePod);
    print("userType==${userTypeState.value}");
    return DefaultTabController(
      length: userTypeState.value == "T" ? 2 : 3,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("DashBoard"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {},
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

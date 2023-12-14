import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/alloted_slot_all_therapist_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/cancelled_slot_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/completed_slot_all_therapist.provider.dart';
import 'package:theraman/src/features/dashboard/application/therapist/providers/dashboard_provider.dart';
import 'package:theraman/src/features/dashboard/application/therapist/providers/ongoing_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_cancelled_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/screen/executive_ongoing_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/custom_cancelled_search.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/custom_completed_search.dart';
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/therapist/screen/ongoing_session_screen.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
import 'package:theraman/src/global/pod/check_user_type_pod.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/custom_ongoing_search.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  DashboardScreen({super.key});

  final currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTypeState = ref.watch(checkUserTypePod);
    final allotSlotState = ref.watch(allotedSlotAllTherapistProvider);
    final completedSlotState = ref.watch(completedSlotAllTherapistProvider);
    final cancelledSlotState = ref.watch(cancelledSlotProvider);
    final therapistAllotedSlotState = ref.watch(onGoingProvider);
    final therapistCompletedState = ref.watch(completedSessionProvider);
    final userState = ref.watch(userProvider);
    return DefaultTabController(
      length: userTypeState.value == "T" ? 2 : 3,
      child: Builder(builder: (context) {
        final tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          currentIndex.value = tabController.index;
        });
        return ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) {
              return Scaffold(
                  appBar: AppBar(
                      title: userTypeState.value == "T"
                          ? userState.easyWhen(
                              data: (value) => FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    "${value.staffName}",
                                    style: const TextStyle(fontSize: 15),
                                  )),
                              errorWidget: (_, __) => const Text("Loading ..."),
                              loadingWidget: () => const Text("Loading ..."),
                            )
                          : Text(
                              DateFormat('yyyy-MM-dd').format(DateTime.now()),
                              style: const TextStyle(fontSize: 18),
                            ),
                      actions: userTypeState.value == "E"
                          ? [
                              IconButton(
                                  onPressed: () {
                                    value == 0
                                        ? showSearch(
                                            context: context,
                                            delegate: allotSlotState.when(
                                              data: (value) =>
                                                  CustomOngoingSearch(
                                                      allotSlots:
                                                          value.allotSlots),
                                              error: (_, __) =>
                                                  CustomOngoingSearch(
                                                      allotSlots: []),
                                              loading: () =>
                                                  CustomOngoingSearch(
                                                      allotSlots: []),
                                            ))
                                        : value == 1
                                            ? showSearch(
                                                context: context,
                                                delegate:
                                                    completedSlotState.when(
                                                  data: (value) =>
                                                      CustomCompletedSearch(
                                                          allotSlots:
                                                              value.allotSlots),
                                                  error: (_, __) =>
                                                      CustomCompletedSearch(
                                                          allotSlots: []),
                                                  loading: () =>
                                                      CustomCompletedSearch(
                                                          allotSlots: []),
                                                ))
                                            : showSearch(
                                                context: context,
                                                delegate:
                                                    cancelledSlotState.when(
                                                  data: (value) =>
                                                      CustomCancelledSearch(
                                                          allotSlots:
                                                              value.allotSlots),
                                                  error: (_, __) =>
                                                      CustomCancelledSearch(
                                                          allotSlots: []),
                                                  loading: () =>
                                                      CustomCancelledSearch(
                                                          allotSlots: []),
                                                ));
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    userLogout(context: context);
                                  },
                                  icon: const Icon(Icons.logout))
                            ]
                          : [
                              IconButton(
                                  onPressed: () {
                                    userLogout(context: context);
                                  },
                                  icon: const Icon(Icons.logout))
                            ],
                      bottom: TabBar(
                          tabs: userTypeState.value == "T"
                              ? [
                                  Tab(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: therapistAllotedSlotState.easyWhen(
                                        data: (value) => Text(
                                          "ONGOING(${value.allotSlots!.length})",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        errorWidget: (_, __) => const Text(
                                          "ONGOING",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        loadingWidget: () => const Text(
                                          "ONGOING",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: therapistCompletedState.easyWhen(
                                        data: (value) => Text(
                                          "COMPLETED(${value.allotSlots!.length})",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        errorWidget: (_, __) => const Text(
                                          "COMPLETED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        loadingWidget: () => const Text(
                                          "COMPLETED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              : [
                                  Tab(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: allotSlotState.easyWhen(
                                        data: (value) => Text(
                                          "ONGOING(${value.allotSlots!.length})",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        errorWidget: (_, __) => const Text(
                                          "ONGOING",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        loadingWidget: () => const Text(
                                          "ONGOING",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: completedSlotState.easyWhen(
                                        data: (value) => Text(
                                          "COMPLETED(${value.allotSlots!.length})",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        errorWidget: (_, __) => const Text(
                                          "COMPLETED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        loadingWidget: () => const Text(
                                          "COMPLETED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: cancelledSlotState.easyWhen(
                                        data: (value) => Text(
                                          "CANCELLED(${value.allotSlots!.length})",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        errorWidget: (_, __) => const Text(
                                          "CANCELLED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        loadingWidget: () => const Text(
                                          "CANCELLED",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])),
                  drawer: const DrawerWidget(currentPage: "DashboardRoute"),
                  // ignore: deprecated_member_use
                  body: WillPopScope(
                    onWillPop: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm Exit'),
                        content:
                            const Text('Do you really want to exit the app?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    ).then((value) => value ?? false),
                    child: TabBarView(
                      children: userTypeState.value == "T"
                          ? [OnGoingSessionScreen(), CompletedSessionScreen()]
                          : [
                              ExecutiveOngoingSessionScreen(),
                              const ExecutiveCompletedSessionScreen(),
                              ExecutiveCancelledSessionScreen(),
                            ],
                    ),
                  ));
            });
      }),
    );
  }
}

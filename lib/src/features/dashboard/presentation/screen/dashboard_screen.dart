import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/presentation/screen/completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/screen/ongoing_session_screen.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("DashBoard"),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text(
                  "ONGOING",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "COMPLETED",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          drawer: const DrawerWidget(currentPage: "DashboardRoute"),
          body: TabBarView(
            children: [
              OnGoingSessionScreen(),
              CompletedSessionScreen(),
            ],
          )),
    );
  }
}

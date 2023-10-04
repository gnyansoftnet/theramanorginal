import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';

@RoutePage(deferredLoading: true, name: "HomeRoute")
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [DashboardRoute(), UserProfileRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        final tabsRouter = AutoTabsRouter.of(context);

        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (int index) {
            tabsRouter.setActiveIndex(index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              label: "DashBoard",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: "User",
            ),
          ],
        );
      },
    );
  }
}

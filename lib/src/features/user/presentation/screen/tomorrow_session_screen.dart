import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/user/application/providers/tomorrow_session_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "TomorrowSessionRoute")
class TomorrowSessionScreen extends ConsumerWidget {
  const TomorrowSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState = ref.watch(tomorrowSessionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomorrow Session"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([const DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      drawer: const DrawerWidget(currentPage: "TomorrowSessionRoute"),
      body: tomorrowSessionState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(tomorrowSessionProvider);
            },
            child: value.allotSlots!.isEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          "assets/images/svg/blank.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Expanded(
                          child: Text(
                        "You do not have any tomorrow session",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],
                  )
                : ListView.builder(
                    itemCount: value.allotSlots!.length,
                    itemBuilder: ((context, index) {
                      final data = value.allotSlots![index];
                      return Card(
                        elevation: 4.0,
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -1),
                              leading: Text(
                                "${data.rSPName}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -1),
                              leading: Text(
                                "${data.rSSlotType}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              trailing: Text(
                                "${data.rSStartTime}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
          ),
        );
      }),
    );
  }
}

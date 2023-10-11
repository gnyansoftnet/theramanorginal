import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../application/providers/dashboard_provider.dart';

@RoutePage(deferredLoading: true, name: "OnGoingSessionRoute")
class OnGoingSessionScreen extends ConsumerWidget {
  OnGoingSessionScreen({super.key});

  final dashboardController = DashboardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(dashboardProvider);
    return Scaffold(
      body: allotedSlotState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dashboardProvider);
            },
            child: value.allotSlots!.isEmpty
                ? const Center(
                    child: AutoSizeText("you did not complete any session"),
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];

                      return data.rSSlotStatus != "Completed"
                          ? Card(
                              elevation: 5.0,
                              color: data.rSSlotStatus == "Started"
                                  ? AppColors.blue
                                  : AppColors.cyan,
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    leading: AutoSizeText(
                                      "${data.rSPName}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    leading: AutoSizeText(
                                      "${data.rSSlotType}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                  ListTile(
                                      dense: true,
                                      visualDensity:
                                          const VisualDensity(vertical: -1),
                                      leading: AutoSizeText(
                                        "${data.rSStartTime}",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      trailing: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5.0,
                                              minimumSize: const Size(120, 40)),
                                          onPressed: () {
                                            dashboardController.session(
                                                context: context,
                                                ref: ref,
                                                rsSlotId:
                                                    data.rSSlotId.toString(),
                                                status: data.rSSlotStatus
                                                    .toString());
                                          },
                                          child: AutoSizeText(
                                              data.rSSlotStatus == "Started"
                                                  ? "Complete"
                                                  : "Start ")))
                                ],
                              ),
                            )
                          : Container();
                    }),
          ),
        );
      }),
    );
  }
}

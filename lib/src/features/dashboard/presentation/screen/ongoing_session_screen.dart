import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/features/dashboard/application/providers/ongoing_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "OnGoingSessionRoute")
class OnGoingSessionScreen extends ConsumerWidget {
  OnGoingSessionScreen({super.key});
  final dashboardController = DashboardController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(onGoingProvider);
    return Scaffold(
      body: allotedSlotState.easyWhen(onRetry: () {
        ref.invalidate(onGoingProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(onGoingProvider);
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
                      gapH8,
                      const Expanded(
                          child: Text(
                        "You do not have any alloted slot",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return Card(
                        elevation: 5.0,
                        color: data.rSSlotStatus == "Started"
                            ? AppColors.blue
                            : AppColors.cyan,
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -3),
                              leading: Text(
                                "${data.rSPName}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
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
                            ),
                            ListTile(
                                dense: true,
                                visualDensity:
                                    const VisualDensity(vertical: -1),
                                leading: Text(
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
                                    onPressed: index != 0
                                        ? null
                                        : () {
                                            dashboardController.session(
                                                context: context,
                                                ref: ref,
                                                rsSlotId:
                                                    data.rSSlotId.toString(),
                                                status: data.rSSlotStatus
                                                    .toString());
                                          },
                                    child: Text(
                                      data.rSSlotStatus == "Started"
                                          ? "Complete"
                                          : index == 0
                                              ? "Start"
                                              : "Disable",
                                      style: TextStyle(
                                          color: index != 0
                                              ? AppColors.white
                                              : AppColors.blue,
                                          fontWeight: FontWeight.bold),
                                    )))
                          ],
                        ),
                      );
                    }),
          ),
        );
      }),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/completed_slot_all_therapist.provider.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveCompletedSessionRoute")
class ExecutiveCompletedSessionScreen extends ConsumerWidget {
  const ExecutiveCompletedSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedSessionState = ref.watch(completedSlotAllTherapistProvider);
    return Scaffold(
      body: completedSessionState.easyWhen(onRetry: () {
        ref.invalidate(completedSlotAllTherapistProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(completedSlotAllTherapistProvider);
            },
            child: value.allotSlots!.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/svg/blank.svg",
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      gapH8,
                      const Text(
                        "Did not complete any session today",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return Card(
                        elevation: 5.0,
                        color: AppColors.green,
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
                              trailing: Text(
                                "${data.rSStartTime}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -3),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${data.rSTherapistStartTime}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "-",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "${data.rSTherapistEndTime}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              trailing: Text(
                                "${data.rSDuration}",
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
          ),
        );
      }),
    );
  }
}

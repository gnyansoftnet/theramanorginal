import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/application/providers/ongoing_provider.dart';
import 'package:theraman/src/features/therapist/presentation/controller/therapist_controller.dart';
import 'package:theraman/src/global/pod/curr_loc_status.dart';
import 'package:theraman/src/global/widgets/empty_widget.dart';
import 'package:theraman/src/global/widgets/snack_content_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

@RoutePage(deferredLoading: true, name: "OnGoingSessionRoute")
class OnGoingSessionScreen extends ConsumerWidget {
  OnGoingSessionScreen({super.key});
  final therapistController = TherapistController();
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
                ? EmptyWidget(onPressed: () {
                    ref.invalidate(onGoingProvider);
                  })
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
                                        elevation: 2.0,
                                        backgroundColor:
                                            data.rSSlotStatus == "Started"
                                                ? Theme.of(context).primaryColor
                                                : AppColors.blue,
                                        minimumSize: const Size(120, 40)),
                                    onPressed: index != 0
                                        ? null
                                        : () async {
                                            if (await ref.watch(
                                                    currLocStatus.selectAsync(
                                                        (data) => data)) &&
                                                context.mounted) {
                                              therapistController.session(
                                                  context: context,
                                                  ref: ref,
                                                  rsSlotId: data.rSSlotId ?? 0,
                                                  status: data.rSSlotStatus
                                                      .toString());
                                            } else {
                                              context.showSnackBar(
                                                  const SnackContentWidget(
                                                content:
                                                    "You are not in office location",
                                              ));
                                            }
                                          },
                                    child: Text(
                                      data.rSSlotStatus == "Started"
                                          ? "Complete"
                                          : index == 0
                                              ? "Start"
                                              : "Start",
                                      style: TextStyle(
                                          color: AppColors.white,
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

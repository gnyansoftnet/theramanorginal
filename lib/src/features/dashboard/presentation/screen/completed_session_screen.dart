import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';
import '../../application/providers/dashboard_provider.dart';
import '../controller/dashboard_controller.dart';

@RoutePage(deferredLoading: true, name: "CompletedSessionRoute")
class CompletedSessionScreen extends ConsumerWidget {
  CompletedSessionScreen({super.key});
  final dashoardController = DashboardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedSessionState = ref.watch(completedSessionProvider);
    return Scaffold(
      body: completedSessionState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(completedSessionProvider);
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
                      return Card(
                        elevation: 5.0,
                        color: AppColors.green,
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -3),
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
                              visualDensity: const VisualDensity(vertical: -3),
                              leading: AutoSizeText(
                                "${data.rSSlotType}",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                              trailing: AutoSizeText(
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
                                  AutoSizeText(
                                    "${data.rSTherapistStartTime}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  AutoSizeText(
                                    "-",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  AutoSizeText(
                                    "${data.rSTherapistEndTime}",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              trailing: AutoSizeText(
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

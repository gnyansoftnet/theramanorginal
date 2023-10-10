import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../application/providers/dashboard_provider.dart';

@RoutePage(deferredLoading: true, name: "OnGoingSessionRoute")
class OnGoingSessionScreen extends ConsumerWidget {
  const OnGoingSessionScreen({super.key});

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
                      print("indesin====$index");
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
                                            getdata();
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

  getdata() {
    DateTime today = DateTime.now();
    print(today); //2023-01-16 09:51:27.494057

    DateTime yesterday = today.add(const Duration(days: 1));
    final date = DateFormat('MM/dd/yyyy').format(yesterday);
    print(date);
  }
}

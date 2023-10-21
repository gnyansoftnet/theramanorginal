import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/executive/application/provider/therapist_leave_status_provider.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExeLeaveStatusRoute")
class ExeLeaveStatusScreen extends ConsumerWidget {
  const ExeLeaveStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveStatusState = ref.watch(therapistLeaveStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Status"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([const DashboardRoute()]);
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      drawer: const DrawerWidget(currentPage: "ExeLeaveStatusRoute"),
      body: leaveStatusState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: value.leaveDtls!.length,
              itemBuilder: (context, index) {
                final data = value.leaveDtls![index];
                return Card(
                  elevation: 4.0,
                  color: data.leaveStatus == "Approved"
                      ? AppColors.green
                      : data.leaveStatus == "Rejected"
                          ? AppColors.red
                          : AppColors.cyan,
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        leading: Text(
                          "${data.staffName}",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        leading: Text(
                          "${data.leaveType}",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        trailing: Text(
                          "${data.noOfDays}",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${data.leaveFrom}",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            gapW4,
                            Text(
                              "to",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            gapW4,
                            Text(
                              "${data.leaveTo}",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                        trailing: Text(
                          "${data.leaveStatus}",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }
}

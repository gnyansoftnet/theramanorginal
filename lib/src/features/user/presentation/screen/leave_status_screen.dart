import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "LeaveStatusRoute")
class LeaveStatusScreen extends ConsumerWidget {
  LeaveStatusScreen({super.key});

  final ValueNotifier<String> fromDateValue = ValueNotifier<String>("From");
  final ValueNotifier<String> toDateValue = ValueNotifier<String>("TO");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveDetailsState = ref.watch(leaveStatusProvider);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        title: const Text("Leave Status"),
      ),
      drawer: const DrawerWidget(currentPage: "LeaveStatusRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(leaveStatusProvider);
                },
                child: leaveDetailsState.easyWhen(data: (value) {
                  return ListView.builder(
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
                                visualDensity:
                                    const VisualDensity(vertical: -4),
                                leading: AutoSizeText(
                                  "${data.leaveType}",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                trailing: AutoSizeText(
                                  "${data.noOfDays}",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              ListTile(
                                visualDensity:
                                    const VisualDensity(vertical: -4),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AutoSizeText(
                                      "${data.leaveFrom}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    gapW4,
                                    AutoSizeText(
                                      "to",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    gapW4,
                                    AutoSizeText(
                                      "${data.leaveTo}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                trailing: AutoSizeText(
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
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

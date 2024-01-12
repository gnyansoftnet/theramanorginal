import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/executive/application/provider/therapist_leave_status_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/helper/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExeLeaveStatusRoute")
class ExeLeaveStatusScreen extends ConsumerWidget {
  ExeLeaveStatusScreen({super.key});
  final fromDateValue =
      ValueNotifier<String>(DateFormat("MM/dd/yyy").format(DateTime.now()));
  final toDateValue =
      ValueNotifier<String>(DateFormat("MM/dd/yyy").format(DateTime.now()));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveStatusState = ref.watch(therapistLeaveStatusProvider(
        Date(from: fromDateValue.value, to: toDateValue.value)));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Status"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([DashboardRoute()]);
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      drawer: const DrawerWidget(currentPage: "ExeLeaveStatusRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                flex: 0,
                child: Row(
                  children: [
                    dateFieldBox(
                        context: context,
                        dateValue: fromDateValue,
                        onTap: () {
                          showDateTimeRangePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1600),
                            lastDate: DateTime(2500000),
                          ).then((value) {
                            fromDateValue.value =
                                DateFormat('MM/dd/yyy').format(value);
                          }).onError((error, stackTrace) => null);
                        }),
                  gap4,
                    dateFieldBox(
                      context: context,
                      dateValue: toDateValue,
                      onTap: () {
                        showDateTimeRangePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1600),
                          lastDate: DateTime(2500000),
                        ).then((value) {
                          toDateValue.value =
                              DateFormat('MM/dd/yyy').format(value);
                        }).onError((error, stackTrace) => null);
                      },
                    ),
                    gap8,
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            ref.watch(therapistLeaveStatusProvider(Date(
                                from: fromDateValue.value,
                                to: toDateValue.value)));
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 1.0,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(width: 0.5),
                                  borderRadius: BorderRadius.all(Radius.zero))),
                          child: const Text("Search")),
                    )
                  ],
                )),
            Expanded(
              child: leaveStatusState.easyWhen(onRetry: () async {
                ref.invalidate(therapistLeaveStatusProvider);
              }, data: (value) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(therapistLeaveStatusProvider);
                  },
                  child: value.leaveDtls!.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/svg/blank.svg",
                                fit: BoxFit.cover,
                                height: MediaQuery.sizeOf(context).height / 3,
                              ),
                              gap8,
                              const Text("Ohh ! leave status is empty"),
                              gap8,
                              ElevatedButton(
                                  onPressed: () {
                                    ref.invalidate(
                                        therapistLeaveStatusProvider);
                                  },
                                  child: const Text("Refresh"))
                            ],
                          ),
                        )
                      : ListView.builder(
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
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    leading: Text(
                                      "${data.staffName}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
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
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
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
                                      gap4,
                                        Text(
                                          "to",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        gap4,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget dateFieldBox(
      {required BuildContext context,
      required ValueNotifier dateValue,
      required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            border: Border.all(color: AppColors.black, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: AppColors.black,
                ),
                gap8,
                ValueListenableBuilder(
                    valueListenable: dateValue,
                    builder: (context, value, child) {
                      return Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

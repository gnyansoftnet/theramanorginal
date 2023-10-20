import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
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
  final ValueNotifier<String> toDateValue = ValueNotifier<String>("To");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveDetailsState = ref.watch(leaveStatusProvider(
        Date(from: fromDateValue.value, to: toDateValue.value)));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Status"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([const DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      drawer: const DrawerWidget(currentPage: "LeaveStatusRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDateTimeRangePicker(
                          context: context,
                        ).then((value) {
                          fromDateValue.value =
                              DateFormat('yyyy-MM-dd').format(value);
                        }).onError((error, stackTrace) => null);
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              ValueListenableBuilder(
                                  valueListenable: fromDateValue,
                                  builder: (context, value, child) {
                                    return Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          value,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  gapW4,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDateTimeRangePicker(
                          context: context,
                        ).then((value) {
                          toDateValue.value =
                              DateFormat('yyyy-MM-dd').format(value);
                        }).onError((error, stackTrace) => null);
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              ValueListenableBuilder(
                                  valueListenable: toDateValue,
                                  builder: (context, value, child) {
                                    return Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          value,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  gapW8,
                  ElevatedButton(
                      onPressed: () async {
                        if (fromDateValue.value != 'From' &&
                            toDateValue.value != 'To') {
                          ref.watch(leaveStatusProvider(Date(
                              from: fromDateValue.value,
                              to: toDateValue.value)));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 4.0,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius: BorderRadius.all(Radius.zero))),
                      child: const Text("Search"))
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: RefreshIndicator(
                onRefresh: () async {
                  fromDateValue.value = "From";
                  toDateValue.value = "To";
                  ref.invalidate(leaveStatusProvider);
                },
                child: leaveDetailsState.easyWhen(onRetry: () {
                  ref.invalidate(leaveStatusProvider);
                }, data: (value) {
                  return ListView.builder(
                      itemCount: value.leaveDtls!.length,
                      itemBuilder: (context, index) {
                        final data = value.leaveDtls![index];
                        return value.leaveDtls!.isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg/blank.svg",
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                    const Text(
                                      "You did not apply any leave",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            : Card(
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

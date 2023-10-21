import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/executive/application/provider/exe_tomorrow_session_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExeTomorrowSessionRoute")
class ExeTomorrowSessionScreen extends ConsumerWidget {
  ExeTomorrowSessionScreen({super.key});

  final dateValue = ValueNotifier<String>(DateFormat('MM/dd/yyyy')
      .format(DateTime.now().add(const Duration(days: 1))));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState =
        ref.watch(exeTomorrowSessionProvider(dateValue.value));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomorrow Session"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([const DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      drawer: const DrawerWidget(currentPage: "ExeTomorrowSessionRoute"),
      body: tomorrowSessionState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      showDateTimeRangePicker(
                        context: context,
                        initialDate:
                            DateTime.now().add(const Duration(days: 1)),
                        firstDate: DateTime.now().add(const Duration(days: 1)),
                        lastDate: DateTime(2500000),
                      ).then((value) {
                        dateValue.value =
                            DateFormat('yyyy-MM-dd').format(value);
                        ref.watch(exeTomorrowSessionProvider(dateValue.value));
                      }).onError((error, stackTrace) => null);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: 0.5),
                        // color: AppColors.green
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppColors.black,
                            ),
                            gapW8,
                            ValueListenableBuilder(
                                valueListenable: dateValue,
                                builder: (context, value, child) {
                                  return Text(
                                    value,
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  )),
                  gapW4,
                  ElevatedButton(
                      onPressed: () {
                        ref.watch(exeTomorrowSessionProvider(dateValue.value));
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(width: 0.5),
                              borderRadius: BorderRadius.all(Radius.zero))),
                      child: const Text("Search"))
                ],
              ),
              Expanded(
                // flex: 15,
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(exeTomorrowSessionProvider);
                  },
                  child: value.nextDaySlots!.isEmpty
                      ? Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/svg/blank.svg",
                              fit: BoxFit.cover,
                              height: 250,
                            ),
                            gapH8,
                            ElevatedButton(
                                onPressed: () {
                                  ref.invalidate(exeTomorrowSessionProvider);
                                },
                                child: const Text("Retry"))
                          ],
                        )
                      : ListView.builder(
                          itemCount: value.nextDaySlots!.length,
                          itemBuilder: (context, index) {
                            final data = value.nextDaySlots![index];
                            return Card(
                              elevation: 4.0,
                              color: data.rSSlotStatus == "Cancelled"
                                  ? AppColors.red
                                  : Theme.of(context).cardColor,
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -2),
                                    leading: Text(
                                      "${data.rSPName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color:
                                              data.rSSlotStatus == "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -2),
                                    leading: Text(
                                      "${data.rSSlotType}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color:
                                              data.rSSlotStatus == "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                    ),
                                    trailing: Text(
                                      "${data.rSSessionType}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color:
                                              data.rSSlotStatus == "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -2),
                                    leading: Text(
                                      "${data.rSDoctorName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color:
                                              data.rSSlotStatus == "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                    ),
                                    trailing: Text(
                                      "${data.rSStartTime}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color:
                                              data.rSSlotStatus == "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

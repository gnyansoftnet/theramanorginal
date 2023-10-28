import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/tomorrow_session_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "TomorrowSessionRoute")
class TomorrowSessionScreen extends ConsumerWidget {
  TomorrowSessionScreen({super.key});

  final dateValue = ValueNotifier<String>(DateFormat('MM/dd/yyyy')
      .format(DateTime.now().add(const Duration(days: 1))));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState =
        ref.watch(tomorrowSessionProvider(dateValue.value));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomorrow Session"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      drawer: const DrawerWidget(currentPage: "TomorrowSessionRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        showDateTimeRangePicker(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate:
                              DateTime.now().add(const Duration(days: 1)),
                          lastDate: DateTime(2500000),
                        ).then((value) {
                          dateValue.value =
                              DateFormat('MM/dd/yyyy').format(value);
                          ref.watch(tomorrowSessionProvider(dateValue.value));
                        }).onError((error, stackTrace) => null);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          border:
                              Border.all(color: AppColors.black, width: 0.5),
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
                        onPressed: () async {
                          ref.watch(tomorrowSessionProvider(dateValue.value));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 1.0,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(width: 0.5),
                                borderRadius: BorderRadius.all(Radius.zero))),
                        child: const Text("Search"))
                  ],
                )),
            Expanded(
              child: tomorrowSessionState.easyWhen(data: (value) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(tomorrowSessionProvider);
                  },
                  child: value.allotSlots!.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/svg/blank.svg",
                                fit: BoxFit.cover,
                                height: MediaQuery.sizeOf(context).height / 3,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ref.invalidate(tomorrowSessionProvider);
                                  },
                                  child: const Text("Retry"))
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.allotSlots!.length,
                          itemBuilder: ((context, index) {
                            final data = value.allotSlots![index];
                            return Card(
                              elevation: 4.0,
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -1),
                                    leading: Text(
                                      "${data.rSPName}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -1),
                                    leading: Text(
                                      "${data.rSSlotType}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    trailing: Text(
                                      "${data.rSStartTime}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

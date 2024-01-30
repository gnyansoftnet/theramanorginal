import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/executive/application/provider/exe_tomorrow_session_provider.dart';
import 'package:theraman/src/global/widgets/empty_widget.dart';
import 'package:theraman/src/global/widgets/widget.dart';
import 'package:theraman/src/utils/constants/constant.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

@RoutePage(deferredLoading: true, name: "ExeTomorrowSessionRoute")
class ExeTomorrowSessionScreen extends ConsumerWidget {
  ExeTomorrowSessionScreen({super.key});

  final _dateController = TextEditingController(
      text: DateFormat('MM/dd/yyyy')
          .format(DateTime.now().add(const Duration(days: 1))));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState =
        ref.watch(exeTomorrowSessionProvider(_dateController.text.trim()));
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
      drawer: const DrawerWidget(currentPage: "ExeTomorrowSessionRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                      controller: _dateController,
                      preFixIcon: const Icon(Icons.calendar_month),
                      readOnly: true,
                      onFieldSubmitted: (value) {},
                      validator: FormValidators.requiredWithFieldName(
                              "Date is required")
                          .call,
                      onTap: () async {
                        await DateTimeExtension.showDate(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate:
                              DateTime.now().add(const Duration(days: 1)),
                          lastDate: DateTime(DateTime.now().year + 1),
                        ).then((value) {
                          _dateController.text =
                              DateFormat('MM/dd/yyy').format(value);
                          ref.watch(exeTomorrowSessionProvider(
                              _dateController.text.trim()));
                        });
                      },
                      hint: "MM/DD/YYY"),
                ),
                gap4,
                ElevatedButton(
                    onPressed: () async {
                      ref.watch(exeTomorrowSessionProvider(
                          _dateController.text.trim()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(17),
                        elevation: 4.0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.zero))),
                    child: const Text("SEARCH"))
              ],
            ),
            Expanded(
              child: tomorrowSessionState.easyWhen(onRetry: () {
                ref.invalidate(exeTomorrowSessionProvider);
              }, data: (value) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(exeTomorrowSessionProvider);
                  },
                  child: value.allotSlots!.isEmpty
                      ? EmptyWidget(onPressed: () {
                          ref.invalidate(exeTomorrowSessionProvider);
                        })
                      : ListView.builder(
                          itemCount: value.allotSlots!.length,
                          itemBuilder: (context, index) {
                            final data = value.allotSlots![index];
                            return Card(
                              elevation: 4.0,
                              color: data.rSSlotStatus == "Cancelled"
                                  ? AppColors.red
                                  : Theme.of(context).cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${data.rSPName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: data.rSSlotStatus ==
                                                        "Cancelled"
                                                    ? AppColors.white
                                                    : AppColors.black),
                                          ),
                                        ),
                                        PopupMenuButton(
                                          itemBuilder: (context) =>
                                              <PopupMenuEntry<String>>[
                                            PopupMenuItem(
                                                child: ListTile(
                                              onTap: () {
                                                Navigator.pop(context);
                                                context.navigateTo(
                                                    SessionRescheduleRoute(
                                                        allotSlots: data));
                                              },
                                              dense: true,
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -4),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(
                                                  Icons.change_circle),
                                              title: const Text(
                                                  "Session Reschedule"),
                                            )),
                                            PopupMenuItem(
                                                child: ListTile(
                                              onTap: () {
                                                Navigator.pop(context);
                                                context.navigateTo(
                                                    ChangeTherapistRoute(
                                                        allotSlots: data));
                                              },
                                              dense: true,
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -4),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(Icons.group),
                                              title: const Text(
                                                  "Change Therapist"),
                                            )),
                                            PopupMenuItem(
                                                child: ListTile(
                                              onTap: () {
                                                Navigator.pop(context);
                                                context.navigateTo(
                                                    CancelSessionRoute(
                                                        allotSlots: data));
                                              },
                                              dense: true,
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -4),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(Icons.cancel),
                                              title: const Text(
                                                  " Session Cancellation"),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    gap8,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${data.rSSlotType}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: data.rSSlotStatus ==
                                                        "Cancelled"
                                                    ? AppColors.white
                                                    : AppColors.black),
                                          ),
                                        ),
                                        Text(
                                          "${data.rSSessionType}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: data.rSSlotStatus ==
                                                      "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                        ),
                                      ],
                                    ),
                                    gap8,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${data.rSDoctorName}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: data.rSSlotStatus ==
                                                      "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                        ),
                                        Text(
                                          "${data.rSStartTime}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: data.rSSlotStatus ==
                                                      "Cancelled"
                                                  ? AppColors.white
                                                  : AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
}

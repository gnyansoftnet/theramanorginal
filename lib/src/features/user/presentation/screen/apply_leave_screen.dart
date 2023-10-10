import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/features/user/presentation/controller/user_controller.dart';
import 'package:theraman/src/features/user/presentation/widget/apply_leave_button.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';

import 'package:theraman/src/utils/constants/gaps.dart';

import '../../../../utils/common_methods.dart';

@RoutePage(deferredLoading: true, name: "ApplyLeaveRoute")
class ApplyLeaveScreen extends StatelessWidget {
  ApplyLeaveScreen({super.key});

  final ValueNotifier<String> fromDateValue = ValueNotifier<String>("yy-mm-dd");
  final ValueNotifier<String> toDate = ValueNotifier<String>("yy-mm-dd");
  final ValueNotifier<bool> isOneDay = ValueNotifier<bool>(false);
  TextEditingController reasonController = TextEditingController();
  TextEditingController noOfDaysController = TextEditingController();

  final ValueNotifier<String> leaveTypeValue =
      ValueNotifier<String>('Medical Leave');
  List<String> leaveType = [
    'Medical Leave',
    'Emergency Leave',
    'Casual Leave',
    'Other'
  ];
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText("Apply Leave"),
      ),
      drawer: const DrawerWidget(currentPage: "ApplyLeaveRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AutoSizeText("Apllicants Name  :"),
                gapH8,
                Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Consumer(builder: (context, ref, _) {
                      final userState = ref.watch(userProvider);
                      final userName =
                          userState.whenData((value) => value.staffName);
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AutoSizeText(userName.value == null
                            ? "Dr. Demo"
                            : "${userName.value}"),
                      );
                    }))
              ],
            ),
            gapH20,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AutoSizeText("Number Of Days :"),
                gapH4,
                TextFieldWidget(
                  controller: noOfDaysController,
                  onChanged: (value) {
                    print("value==${value.runtimeType}");
                    if (value == "1" || value == "0.5") {
                      isOneDay.value = true;
                    } else {
                      isOneDay.value = false;
                    }
                  },
                )
              ],
            ),
            gapH20,
            ValueListenableBuilder(
                valueListenable: isOneDay,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      value
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const AutoSizeText("Date"),
                                gapH4,
                                InkWell(
                                  onTap: () {
                                    showDateTimeRangePicker(
                                            context: context,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2101))
                                        .then((value) {
                                      fromDateValue.value =
                                          DateFormat('yyyy-MM-dd')
                                              .format(value);
                                      toDate.value = DateFormat('yyyy-MM-dd')
                                          .format(value);
                                    });
                                  },
                                  child: Container(
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.calendar_month),
                                          ValueListenableBuilder(
                                              valueListenable: fromDateValue,
                                              builder: (context, value, child) {
                                                return AutoSizeText(
                                                    value.toString());
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AutoSizeText("From Date"),
                                      gapH4,
                                      InkWell(
                                        onTap: () {
                                          showDateTimeRangePicker(
                                                  context: context,
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2101))
                                              .then((value) {
                                            fromDateValue.value =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(value);
                                            if (noOfDaysController
                                                    .text.isNotEmpty &&
                                                noOfDaysController.text
                                                    .contains('.')) {
                                              final valueDouble = (double.parse(
                                                      noOfDaysController.text))
                                                  .round();
                                              toDate.value = DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(value.add(Duration(
                                                      days: valueDouble - 1)));
                                            } else {
                                              toDate.value = DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(value.add(Duration(
                                                      days: (int.parse(
                                                              noOfDaysController
                                                                  .text)) -
                                                          1)));
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.calendar_month),
                                                ValueListenableBuilder(
                                                    valueListenable:
                                                        fromDateValue,
                                                    builder: (context, value,
                                                        child) {
                                                      return AutoSizeText(
                                                          value.toString());
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                gapW12,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AutoSizeText("To Date"),
                                      gapH4,
                                      InkWell(
                                        onTap: () {
                                          // showDateTimeRangePicker(
                                          //         context: context,
                                          //         firstDate: DateTime.now(),
                                          //         lastDate: DateTime(2101))
                                          //     .then((value) {
                                          //   toDate.value =
                                          //       DateFormat('yyyy-MM-dd')
                                          //           .format(value);
                                          // });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.calendar_month),
                                                ValueListenableBuilder(
                                                    valueListenable: toDate,
                                                    builder: (context, value,
                                                        child) {
                                                      return AutoSizeText(
                                                          value.toString());
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ],
                  );
                }),
            gapH20,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AutoSizeText("Chooose the type"),
                gapH8,
                ValueListenableBuilder(
                    valueListenable: leaveTypeValue,
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        elevation: 3,
                        // hint: const Text("Choose"),

                        isExpanded: true,
                        value: value,
                        onChanged: (newValue) {
                          leaveTypeValue.value = newValue!;
                        },
                        items: leaveType
                            .map<DropdownMenuItem<String>>((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                      );
                    }),
              ],
            ),
            gapH20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AutoSizeText("Specify the reson for Leave"),
                gapH8,
                TextFieldWidget(
                  controller: reasonController,
                  maxLines: 5,
                ),
              ],
            ),
            gapH20,
            Consumer(builder: (context, ref, _) {
              return ApplyLeaveButton(onSubmit: () {
                userController.applyLeave(
                    ref: ref,
                    fromDate: fromDateValue.value.toString(),
                    toDate: toDate.value.toString(),
                    leaveType: leaveTypeValue.value.toString(),
                    reason: reasonController.text);
              });
            }),
          ],
        ),
      ),
    );
  }
}

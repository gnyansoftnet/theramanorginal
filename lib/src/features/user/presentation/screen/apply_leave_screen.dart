import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/features/user/presentation/controller/user_controller.dart';
import 'package:theraman/src/features/user/presentation/widget/apply_leave_button.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "ApplyLeaveRoute")
class ApplyLeaveScreen extends StatelessWidget {
  ApplyLeaveScreen({super.key});

  final ValueNotifier<String> fromDateValue = ValueNotifier<String>("yy-mm-dd");
  final ValueNotifier<String> toDateValue = ValueNotifier<String>("yy-mm-dd");
  final ValueNotifier<bool> isOneDay = ValueNotifier<bool>(false);
  TextEditingController reasonController = TextEditingController();
  TextEditingController noOfDaysController = TextEditingController();
  final userController = UserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<String> leaveTypeValue = ValueNotifier<String>('');
  List<String> leaveType = [
    'Medical Leave',
    'Emergency Leave',
    'Casual Leave',
    'Other'
  ];

  final TextStyle _textStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Leave"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([const DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      drawer: const DrawerWidget(currentPage: "ApplyLeaveRoute"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Aplicant Name :",
                    style: _textStyle,
                  ),
                  gapH8,
                  Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Consumer(builder: (context, ref, _) {
                        final userState = ref.watch(userProvider);
                        final userName =
                            userState.whenData((value) => value.staffName);
                        return Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(userName.value == null
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
                  Text(
                    "Number Of Days :",
                    style: _textStyle,
                  ),
                  gapH4,
                  TextFieldWidget(
                    controller: noOfDaysController,
                    hint: "Days",
                    maxLines: 1,
                    onChanged: (value) {
                      if (value == "1" || value == "0.5" || value == ".5") {
                        isOneDay.value = true;
                        // fromDateValue.value = "yy-mm-dd";
                        // toDateValue.value = "yy-mm-dd";
                      } else if (fromDateValue.value != "yy-mm-dd" &&
                          toDateValue.value != "yy-mm-dd") {
                        getTodate(value: DateTime.parse(fromDateValue.value));
                        isOneDay.value = false;
                      } else {
                        isOneDay.value = false;
                      }
                    },
                    validator: (p0) {
                      if (p0 != null && p0.isNotEmpty) {
                        return null;
                      }
                      return "Days required";
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
                                  Text(
                                    "Date :",
                                    style: _textStyle,
                                  ),
                                  gapH4,
                                  InkWell(
                                    onTap: () {
                                      showDateTimeRangePicker(
                                        context: context,
                                      ).then((value) {
                                        fromDateValue.value =
                                            DateFormat('yyyy-MM-dd')
                                                .format(value);
                                        toDateValue.value =
                                            DateFormat('yyyy-MM-dd')
                                                .format(value);
                                      }).onError((error, stackTrace) => null);
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
                                                builder:
                                                    (context, value, child) {
                                                  return Text(value.toString());
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
                                        Text(
                                          "From Date :",
                                          style: _textStyle,
                                        ),
                                        gapH4,
                                        InkWell(
                                          onTap: () {
                                            showDateTimeRangePicker(
                                              context: context,
                                            ).then((value) {
                                              fromDateValue.value =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(value);
                                              getTodate(value: value);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons.calendar_month),
                                                  ValueListenableBuilder(
                                                      valueListenable:
                                                          fromDateValue,
                                                      builder: (context, value,
                                                          child) {
                                                        return Text(
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
                                        Text(
                                          "To Date :",
                                          style: _textStyle,
                                        ),
                                        gapH4,
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons.calendar_month),
                                                  ValueListenableBuilder(
                                                      valueListenable:
                                                          toDateValue,
                                                      builder: (context, value,
                                                          child) {
                                                        return Text(
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
                  Text(
                    "Leave type:",
                    style: _textStyle,
                  ),
                  gapH8,
                  ValueListenableBuilder(
                      valueListenable: leaveTypeValue,
                      builder: (context, value, child) {
                        return DecoratedBox(
                          decoration: BoxDecoration(border: Border.all()),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            elevation: 3,
                            hint: const Text("Select"),
                            isExpanded: true,
                            value: value.isEmpty ? null : value,
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
                          ),
                        );
                      }),
                ],
              ),
              gapH20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Specify the reson for Leave :",
                    style: _textStyle,
                  ),
                  gapH8,
                  TextFieldWidget(
                    controller: reasonController,
                    maxLines: 3,
                    validator: (p0) {
                      if (p0 != null && p0.isNotEmpty) {
                        return null;
                      }
                      return "Reason required";
                    },
                  ),
                ],
              ),
              gapH20,
              Consumer(builder: (context, ref, _) {
                return ApplyLeaveButton(onSubmit: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (isValidated()) {
                    userController.applyLeave(
                        ref: ref,
                        fromDate: fromDateValue.value.toString(),
                        toDate: toDateValue.value.toString(),
                        leaveType: leaveTypeValue.value.toString(),
                        reason: reasonController.text,
                        noOfDays: noOfDaysController.text);
                  }
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidated() {
    if (fromDateValue.value == "yy-mm-dd" || toDateValue.value == "yy-mm-dd") {
      Fluttertoast.showToast(msg: "Select your date");
      return false;
    } else if (leaveTypeValue.value == "") {
      Fluttertoast.showToast(msg: "Select leave type");
      return false;
    }
    return true;
  }

  void getTodate({required DateTime value}) {
    if (noOfDaysController.text.isNotEmpty &&
        noOfDaysController.text.contains('.')) {
      final valueDouble = (double.parse(noOfDaysController.text)).round();
      toDateValue.value = DateFormat('yyyy-MM-dd')
          .format(value.add(Duration(days: valueDouble - 1)));
    } else if (noOfDaysController.text.isNotEmpty) {
      toDateValue.value = DateFormat('yyyy-MM-dd').format(
          value.add(Duration(days: (int.parse(noOfDaysController.text)) - 1)));
    }
  }
}

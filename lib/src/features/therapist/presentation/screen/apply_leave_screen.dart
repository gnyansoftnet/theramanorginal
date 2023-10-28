import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
import 'package:theraman/src/features/therapist/presentation/controller/user_controller.dart';
import 'package:theraman/src/features/therapist/presentation/widget/apply_leave_button.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "ApplyLeaveRoute")
class ApplyLeaveScreen extends StatelessWidget {
  ApplyLeaveScreen({super.key});

  final fromDateValue = ValueNotifier<String?>(null);
  final toDateValue = ValueNotifier<String?>(null);
  final isOneDay = ValueNotifier<bool>(false);
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
                context.router.replaceAll([DashboardRoute()]);
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
                      }
                      //  else if (fromDateValue.value != null &&
                      //     toDateValue.value != null) {
                      //   getDate(
                      //       value: DateTime.parse(fromDateValue.value ?? ""));
                      //   isOneDay.value = false;

                      // }
                      else {
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
                                  dateFieldBox(
                                    dateValue: fromDateValue,
                                    onTap: () {
                                      showDateTimeRangePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1600),
                                              lastDate: DateTime(250000))
                                          .then((value) {
                                        fromDateValue.value =
                                            DateFormat('MM/dd/yyy')
                                                .format(value);
                                        toDateValue.value =
                                            DateFormat('MM/dd/yyy')
                                                .format(value);
                                      }).onError((error, stackTrace) => null);
                                    },
                                  ),
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
                                        dateFieldBox(
                                            dateValue: fromDateValue,
                                            onTap: () {
                                              showDateTimeRangePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1600),
                                                      lastDate:
                                                          DateTime(250000))
                                                  .then((value) {
                                                fromDateValue.value =
                                                    DateFormat('MM/dd/yyy')
                                                        .format(value);
                                                getDate(value: value);
                                              }).onError((error, stackTrace) =>
                                                      null);
                                            })
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
                                        dateFieldBox(
                                            dateValue: toDateValue,
                                            onTap: () {}),
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
                  DropdownButtonFormField<String>(
                    elevation: 3,
                    hint: const Text("Select"),
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(0)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(0)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(0)),
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    validator: (p0) {
                      if (p0 != null && p0.isNotEmpty) {
                        return null;
                      }
                      return "leave type is required";
                    },
                    onChanged: (newValue) {
                      leaveTypeValue.value = newValue!;
                    },
                    items:
                        leaveType.map<DropdownMenuItem<String>>((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                  ),
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
    if (fromDateValue.value == null || toDateValue.value == null) {
      Fluttertoast.showToast(msg: "Select your date");
      return false;
    } else if (leaveTypeValue.value == "") {
      Fluttertoast.showToast(msg: "Select leave type");
      return false;
    }
    return true;
  }

  void getDate({required DateTime value}) {
    if (noOfDaysController.text.isNotEmpty &&
        noOfDaysController.text.contains('.')) {
      final valueDouble = (double.parse(noOfDaysController.text)).round();
      toDateValue.value = DateFormat('MM/dd/yyy')
          .format(value.add(Duration(days: valueDouble - 1)));
    } else if (noOfDaysController.text.isNotEmpty) {
      toDateValue.value = DateFormat('MM/dd/yyy').format(
          value.add(Duration(days: (int.parse(noOfDaysController.text)) - 1)));
    }
  }

  Widget dateFieldBox(
      {required ValueNotifier dateValue, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 1),
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
                    return Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          value ?? "MM/dd/yyy",
                          style: TextStyle(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

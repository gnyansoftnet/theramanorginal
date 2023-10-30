import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/executive/presentation/controller/exe_controller.dart';
import 'package:theraman/src/features/executive/presentation/widget/exe_apply_leave_button.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExeApplyLeaveRoute")
class ExeApplyLeave extends StatelessWidget {
  ExeApplyLeave({super.key});

  final _fromDateValue = ValueNotifier<String?>(null);
  final _toDateValue = ValueNotifier<String?>(null);
  final _isOneDay = ValueNotifier<bool>(false);

  final _leaveTypeValue = ValueNotifier<String?>(null);
  List<String> leaveType = [
    'Medical Leave',
    'Emergency Leave',
    'Casual Leave',
    'Other'
  ];

  TextEditingController reasonController = TextEditingController();
  TextEditingController noOfDaysController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextStyle _textStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

  final exeController = ExeController();

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
      drawer: const DrawerWidget(currentPage: "ExeApplyLeaveRoute"),
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
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).dividerColor),
                        color: Theme.of(context).focusColor),
                    child: Consumer(builder: (context, ref, _) {
                      final userState = ref.watch(userProvider);
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: userState.easyWhen(
                            loadingWidget: () => const Text("Loading.."),
                            errorWidget: (_, __) => const Text("Loading.."),
                            data: (value) => Text("${value.staffName}")),
                      );
                    }),
                  )
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
                        _isOneDay.value = true;
                      }
                      //  else if (fromDateValue.value != null &&
                      //     toDateValue.value != null) {
                      //   getDate(
                      //       value: DateTime.parse(fromDateValue.value ?? ""));
                      //   isOneDay.value = false;

                      // }
                      else {
                        _isOneDay.value = false;
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
                  valueListenable: _isOneDay,
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
                                    context: context,
                                    dateValue: _fromDateValue,
                                    onTap: () {
                                      showDateTimeRangePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1600),
                                              lastDate: DateTime(250000))
                                          .then((value) {
                                        _fromDateValue.value =
                                            DateFormat('MM/dd/yyy')
                                                .format(value);
                                        _toDateValue.value =
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
                                            context: context,
                                            dateValue: _fromDateValue,
                                            onTap: () {
                                              showDateTimeRangePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1600),
                                                      lastDate:
                                                          DateTime(250000))
                                                  .then((value) {
                                                _fromDateValue.value =
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
                                            context: context,
                                            dateValue: _toDateValue,
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
                  DropDownButtonFormFieldWidget(
                    hintText: const Text("Select Reason"),
                    validator: (p0) {
                      if (p0 != null && p0.isNotEmpty) {
                        return null;
                      }
                      return "leave type is required";
                    },
                    onChanged: (newValue) {
                      _leaveTypeValue.value = newValue!;
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
                    hint: "Specify reason",
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
                return ExeApplyLeaveButton(onSubmit: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (isValidated()) {
                    exeController.exeApplyLeave(
                        ref: ref,
                        fromDate: _fromDateValue.value.toString(),
                        toDate: _toDateValue.value.toString(),
                        leaveType: _leaveTypeValue.value.toString(),
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
    if (_fromDateValue.value == null || _toDateValue.value == null) {
      Fluttertoast.showToast(msg: "Select your date");
      return false;
    }
    return true;
  }

  void getDate({required DateTime value}) {
    if (noOfDaysController.text.isNotEmpty &&
        noOfDaysController.text.contains('.')) {
      final valueDouble = (double.parse(noOfDaysController.text)).round();
      _toDateValue.value = DateFormat('MM/dd/yyy')
          .format(value.add(Duration(days: valueDouble - 1)));
    } else if (noOfDaysController.text.isNotEmpty) {
      _toDateValue.value = DateFormat('MM/dd/yyy').format(
          value.add(Duration(days: (int.parse(noOfDaysController.text)) - 1)));
    }
  }

  Widget dateFieldBox(
      {required BuildContext context,
      required ValueNotifier dateValue,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            border: Border.all(color: Theme.of(context).dividerColor)),
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

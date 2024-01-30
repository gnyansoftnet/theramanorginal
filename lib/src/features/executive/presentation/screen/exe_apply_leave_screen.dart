import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/executive/presentation/controller/exe_controller.dart';
import 'package:theraman/src/features/executive/presentation/widget/exe_apply_leave_button.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';

import 'package:theraman/src/utils/constants/constant.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

@RoutePage(deferredLoading: true, name: "ExeApplyLeaveRoute")
class ExeApplyLeave extends StatelessWidget {
  ExeApplyLeave({super.key});

  final _fromDateValue = ValueNotifier<String?>(null);
  final _toDateValue = ValueNotifier<String?>(null);
  final _isOneDay = ValueNotifier<bool>(false);

  final _formDateController = TextEditingController();
  final _toDateController = TextEditingController();

  final _leaveTypeValue = ValueNotifier<String?>(null);
  final leaveType = [
    'Medical Leave',
    'Emergency Leave',
    'Casual Leave',
    'Other'
  ];

  final reasonController = TextEditingController();
  final noOfDaysController = TextEditingController();
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
                  gap8,
                  Consumer(builder: (context, ref, _) {
                    return TextFieldWidget(
                      readOnly: true,
                      controller: TextEditingController(
                          text: ref.watch(userProvider
                              .select((value) => value?.Staff_Name ?? ""))),
                    );
                  })
                ],
              ),
              gap20,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Number Of Days :",
                    style: _textStyle,
                  ),
                  gap4,
                  TextFieldWidget(
                    controller: noOfDaysController,
                    hint: "Days",
                    maxLines: 1,
                    keyboardKey: TextInputType.number,
                    onChanged: (value) {
                      if (value == "1" || value == "0.5" || value == ".5") {
                        _isOneDay.value = true;
                      } else {
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
              gap20,
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
                                  gap4,
                                  TextFieldWidget(
                                      controller: _formDateController,
                                      preFixIcon:
                                          const Icon(Icons.calendar_month),
                                      readOnly: true,
                                      onFieldSubmitted: (value) {},
                                      validator:
                                          FormValidators.requiredWithFieldName(
                                                  "Date is required")
                                              .call,
                                      onTap: () async {
                                        await DateTimeExtension.showDate(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate:
                                              DateTime(DateTime.now().year - 1),
                                          lastDate:
                                              DateTime(DateTime.now().year + 1),
                                        ).then((value) {
                                          _formDateController.text =
                                              DateFormat('MM/dd/yyy')
                                                  .format(value);
                                        });
                                      },
                                      hint: "MM/DD/YYY"),
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
                                        gap4,
                                        TextFieldWidget(
                                            controller: _formDateController,
                                            preFixIcon: const Icon(
                                                Icons.calendar_month),
                                            readOnly: true,
                                            onFieldSubmitted: (value) {},
                                            validator: FormValidators
                                                    .requiredWithFieldName(
                                                        "Date is required")
                                                .call,
                                            onTap: () async {
                                              await DateTimeExtension.showDate(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(
                                                    DateTime.now().year - 1),
                                                lastDate: DateTime(
                                                    DateTime.now().year + 1),
                                              ).then((value) {
                                                _formDateController.text =
                                                    DateFormat('MM/dd/yyy')
                                                        .format(value);
                                                getDate(value: value);
                                              });
                                            },
                                            hint: "MM/DD/YYY"),
                                      ],
                                    ),
                                  ),
                                  gap12,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "To Date :",
                                          style: _textStyle,
                                        ),
                                        gap4,
                                        TextFieldWidget(
                                            controller: _toDateController,
                                            preFixIcon: const Icon(
                                                Icons.calendar_month),
                                            readOnly: true,
                                            onFieldSubmitted: (value) {},
                                            validator: FormValidators
                                                    .requiredWithFieldName(
                                                        "Date is required")
                                                .call,
                                            onTap: () async {},
                                            hint: "MM/DD/YYY"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                      ],
                    );
                  }),
              gap20,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Leave type:",
                    style: _textStyle,
                  ),
                  gap8,
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
              gap20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Specify the reson for Leave :",
                    style: _textStyle,
                  ),
                  gap8,
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
              gap20,
              Consumer(builder: (context, ref, _) {
                return ExeApplyLeaveButton(onSubmit: () {
                  if (!_formKey.currentState!.validate()) return;

                  exeController.exeApplyLeave(
                      ref: ref,
                      fromDate: _fromDateValue.value.toString(),
                      toDate: _toDateValue.value.toString(),
                      leaveType: _leaveTypeValue.value.toString(),
                      reason: reasonController.text,
                      noOfDays: noOfDaysController.text);
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  void getDate({required DateTime value}) {
    if (noOfDaysController.text.isNotEmpty &&
        noOfDaysController.text.contains('.')) {
      final valueDouble = (double.parse(noOfDaysController.text)).round();
      _toDateController.text = DateFormat('MM/dd/yyy')
          .format(value.add(Duration(days: valueDouble - 1)));
    } else if (noOfDaysController.text.isNotEmpty) {
      _toDateController.text = DateFormat('MM/dd/yyy').format(
          value.add(Duration(days: (int.parse(noOfDaysController.text)) - 1)));
    }
  }
}

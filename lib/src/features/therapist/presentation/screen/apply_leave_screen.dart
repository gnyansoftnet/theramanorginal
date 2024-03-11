import 'package:auto_route/auto_route.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/therapist/presentation/comp/apply_leave_button.dart';
import 'package:theraman/src/features/therapist/presentation/controller/therapist_controller.dart';
import 'package:theraman/src/global/widgets/widget.dart';
import 'package:theraman/src/utils/constants/constant.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

@RoutePage(deferredLoading: true, name: "ApplyLeaveRoute")
class ApplyLeaveScreen extends StatelessWidget {
  ApplyLeaveScreen({super.key});

  final _formDateController = TextEditingController();
  final _toDateController = TextEditingController();

  final isOneDay = ValueNotifier<bool>(false);
  final reasonController = TextEditingController();
  final noOfDaysController = TextEditingController();
  final therapistController = TherapistController();
  final _formKey = GlobalKey<FormState>();

  final leaveTypeValue = ValueNotifier<String?>(null);
  final leaveType = [
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
                  gap8,
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).dividerColor),
                        color: Theme.of(context).focusColor),
                    child: Consumer(builder: (context, ref, _) {
                      final userName = ref.watch(
                          userProvider.select((value) => value?.Staff_Name));
                      return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(userName ?? ""));
                    }),
                  )
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
                        isOneDay.value = true;
                      } else if (value == null ||
                          noOfDaysController.text.isEmpty) {
                        _formDateController.clear();
                        _toDateController.clear();
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
              gap20,
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
                                              
                                              if (noOfDaysController
                                                  .text.isNotEmpty) {
                                                await DateTimeExtension
                                                    .showDate(
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
                                              } else {
                                                context.showFlash<bool>(
                                                    barrierBlur: 1,
                                                    barrierDismissible: true,
                                                    builder: (context,
                                                            controller) =>
                                                        FlashBarWidget(
                                                            controller:
                                                                controller,
                                                            content:
                                                                "You did not add number of days"));
                                              }
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
                    hintText: const Text("Select"),
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
                return ApplyLeaveButton(onSubmit: () {
                  if (!_formKey.currentState!.validate()) return;
                  therapistController.applyLeave(
                      ref: ref,
                      fromDate: _formDateController.text.trim().toString(),
                      toDate: _toDateController.text.trim().toString(),
                      leaveType: leaveTypeValue.value.toString(),
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

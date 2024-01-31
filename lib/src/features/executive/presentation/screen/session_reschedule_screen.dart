import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/executive/application/provider/reason_provider.dart';
import 'package:theraman/src/features/executive/application/provider/slot_time_provider.dart';
import 'package:theraman/src/features/executive/application/provider/therapist_name_provider.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/features/executive/model/slot_time_model.dart';
import 'package:theraman/src/features/executive/model/therapist_name_model.dart';
import 'package:theraman/src/features/executive/presentation/controller/e_dashboard_controller.dart';
import 'package:theraman/src/features/executive/presentation/widget/session_reschedule_button.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "SessionRescheduleRoute")
class SessionRescheduleScreen extends StatelessWidget {
  final AllotSlots allotSlots;
  SessionRescheduleScreen({super.key, required this.allotSlots});

  final reasonValue = ValueNotifier<String?>(null);
  final therapistValue = ValueNotifier<String?>(null);
  final timeValue = ValueNotifier<String?>(null);
  final dashboardController = EDashboardController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Session Reschedule"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          children: [
            Text(
              "Patient Name",
              style: _textStyle,
            ),
            gap4,
            TextFieldWidget(
              readOnly: true,
              controller:
                  TextEditingController(text: allotSlots.rSPName.toString()),
            ),
            gap12,
            Text(
              "Therapist Name",
              style: _textStyle,
            ),
            gap4,
            TextFieldWidget(
              readOnly: true,
              controller: TextEditingController(
                  text: allotSlots.rSDoctorName.toString()),
            ),
            gap12,
            Text(
              "Therapy Type",
              style: _textStyle,
            ),
            gap4,
            TextFieldWidget(
              readOnly: true,
              controller:
                  TextEditingController(text: allotSlots.rSSlotType.toString()),
            ),
            gap12,
            Text(
              "Session Type",
              style: _textStyle,
            ),
            gap4,
            TextFieldWidget(
              readOnly: true,
              controller: TextEditingController(
                  text: allotSlots.rSSessionType.toString()),
            ),
            gap12,
            Text(
              "Slot Time",
              style: _textStyle,
            ),
            gap4,
            TextFieldWidget(
              readOnly: true,
              controller: TextEditingController(
                  text: "${allotSlots.rSStartTime} -- ${allotSlots.rSEndTime}"
                      .toString()),
            ),
            gap12,
            Text(
              "Reschedule Session Time",
              style: _textStyle,
            ),
            gap4,
            Consumer(builder: (context, ref, _) {
              final slotTimeState = ref.watch(slotTimeProvider);
              return slotTimeState.easyWhen(
                  isLinear: true,
                  errorWidget: (error, stackTrace) =>
                      DropDownButtonFormFieldWidget(
                          hintText: const Text("Select Slot Time"),
                          validator: (p0) {
                            if (p0 != null) {
                              return null;
                            }
                            return "Slot Time is required";
                          },
                          items: const [],
                          onChanged: (newValue) {}),
                  loadingWidget: () => DropDownButtonFormFieldWidget(
                      hintText: const Text("Select Slot Time"),
                      validator: (p0) {
                        if (p0 != null) {
                          return null;
                        }
                        return "Slot Time is required";
                      },
                      items: const [],
                      onChanged: (newValue) {}),
                  data: (value) {
                    final times = value.allSlotTime;
                    return DropDownButtonFormFieldWidget<AllSlotTime>(
                        hintText: const Text("Select Slot Time"),
                        validator: (p0) {
                          if (p0 != null && p0.slotName!.isNotEmpty) {
                            return null;
                          }
                          return "Slot Time is required";
                        },
                        items: times
                                ?.map((time) => DropdownMenuItem<AllSlotTime>(
                                    value: time,
                                    child: Text(time.slotName ?? "")))
                                .toList() ??
                            [],
                        onChanged: (newValue) {
                          timeValue.value = newValue!.slotCode;
                        });
                  });
            }),
            gap12,
            Text(
              "Therapist",
              style: _textStyle,
            ),
            gap4,
            Consumer(builder: (context, ref, _) {
              final therapistNameState = ref.watch(therapistNameProvider);
              return therapistNameState.easyWhen(
                  errorWidget: (error, stackTrace) =>
                      DropDownButtonFormFieldWidget(
                          hintText: const Text("Select Therapist"),
                          validator: (p0) {
                            if (p0 != null) {
                              return null;
                            }
                            return "Therapist Time is required";
                          },
                          items: const [],
                          onChanged: (newValue) {}),
                  loadingWidget: () => DropDownButtonFormFieldWidget(
                      hintText: const Text("Select Therapist"),
                      validator: (p0) {
                        if (p0 != null) {
                          return null;
                        }
                        return "Therapist Time is required";
                      },
                      items: const [],
                      onChanged: (newValue) {}),
                  data: (value) {
                    final staffs = value.allStaffs;

                    return ValueListenableBuilder(
                        valueListenable: therapistValue,
                        builder: (context, value, child) {
                          AllStaffs? selectedStaff = staffs?.firstWhere(
                            (staff) =>
                                staff.staffName == allotSlots.rSDoctorName,
                          );
                          therapistValue.value =
                              selectedStaff!.staffCode.toString();
                          return DropDownButtonFormFieldWidget<AllStaffs>(
                              hintText: const Text("Select Therapist"),
                              value: selectedStaff,
                              validator: (p0) {
                                if (p0 != null && p0.staffName!.isNotEmpty) {
                                  return null;
                                }
                                return "Therapist is required";
                              },
                              items: staffs
                                      ?.map((staff) =>
                                          DropdownMenuItem<AllStaffs>(
                                              value: staff,
                                              child:
                                                  Text(staff.staffName ?? "")))
                                      .toList() ??
                                  [],
                              onChanged: (newValue) {
                                therapistValue.value = newValue!.staffCode;
                              });
                        });
                  });
            }),
            gap12,
            Text(
              "Reason",
              style: _textStyle,
            ),
            gap4,
            Consumer(builder: (context, ref, _) {
              final reasonState = ref.watch(reasonProvider);
              return reasonState.easyWhen(
                  errorWidget: (error, stackTrace) =>
                      DropDownButtonFormFieldWidget(
                          hintText: const Text("Select Reason"),
                          validator: (p0) {
                            if (p0 != null) {
                              return null;
                            }
                            return "Reason is required";
                          },
                          items: const [],
                          onChanged: (newValue) {}),
                  loadingWidget: () => DropDownButtonFormFieldWidget(
                      hintText: const Text("Select Reason"),
                      validator: (p0) {
                        if (p0 != null) {
                          return null;
                        }
                        return "Reason is required";
                      },
                      items: const [],
                      onChanged: (newValue) {}),
                  data: (value) {
                    final reasons = value.reasons;
                    return DropDownButtonFormFieldWidget<Reasons>(
                        hintText: const Text("Select Reason"),
                        items: reasons
                                ?.map((reason) => DropdownMenuItem<Reasons>(
                                    value: reason,
                                    child: Text(reason.reasonName ?? "")))
                                .toList() ??
                            [],
                        validator: (p0) {
                          if (p0 != null && p0.reasonName!.isNotEmpty) {
                            return null;
                          }
                          return "Reason is required";
                        },
                        onChanged: (newValue) {
                          reasonValue.value = newValue!.reasonCode;
                        });
                  });
            }),
            gap24,
            Consumer(builder: (context, ref, _) {
              return SessionRescheduleButton(onSubmit: () {
                if (!_formKey.currentState!.validate()) return;
                if (therapistValue.value != null &&
                    reasonValue.value != null &&
                    timeValue.value != null) {
                  dashboardController.sessionRescdule(
                      context: context,
                      ref: ref,
                      slotId: allotSlots.rSSlotId ?? 0,
                      reason: reasonValue.value.toString(),
                      slotTime: timeValue.value.toString(),
                      therapistName: therapistValue.value.toString());
                } else {
                  Fluttertoast.showToast(msg: "Something is wrong");
                }
              });
            })
          ],
        ),
      ),
    );
  }

  final _textStyle = const TextStyle(fontWeight: FontWeight.bold);
}

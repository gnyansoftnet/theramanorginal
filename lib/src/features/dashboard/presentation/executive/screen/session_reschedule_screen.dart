import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/reason_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/slot_time_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/therapist_name_provider.dart';
import 'package:theraman/src/features/dashboard/model/executive/reason_model.dart';
import 'package:theraman/src/features/dashboard/model/executive/slot_time_model.dart';
import 'package:theraman/src/features/dashboard/model/executive/therapist_name_model.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/session_reschedule_button.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

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
            boxWidget(context: context, title: allotSlots.rSPName.toString()),
            gapH12,
            Text(
              "Therapist Name",
              style: _textStyle,
            ),
            boxWidget(
                context: context, title: allotSlots.rSDoctorName.toString()),
            gapH12,
            Text(
              "Therapy Type",
              style: _textStyle,
            ),
            boxWidget(
                context: context, title: allotSlots.rSSlotType.toString()),
            gapH12,
            Text(
              "Session Type",
              style: _textStyle,
            ),
            boxWidget(
                context: context, title: allotSlots.rSSessionType.toString()),
            gapH12,
            Text(
              "Slot Time",
              style: _textStyle,
            ),
            boxWidget(
                context: context,
                title: "${allotSlots.rSStartTime} -- ${allotSlots.rSEndTime}"
                    .toString()),
            gapH12,
            Text(
              "Reschedule Session Time",
              style: _textStyle,
            ),
            Consumer(builder: (context, ref, _) {
              final slotTimeState = ref.watch(slotTimeProvider);
              return slotTimeState.easyWhen(
                  isLinear: true,
                  errorWidget: (error, stackTrace) =>
                      const LinearProgressIndicator(),
                  data: (value) {
                    final times = value.allSlotTime;
                    return DropdownButtonFormField<AllSlotTime>(
                        isExpanded: true,
                        hint: const Text("Select time"),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          enabled: false,
                          border: InputBorder.none,
                          fillColor: Theme.of(context).focusColor,
                        ),
                        validator: (p0) {
                          if (p0 != null && p0.slotName!.isNotEmpty) {
                            return null;
                          }
                          return "Time is required";
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
            gapH12,
            Text(
              "Therapist",
              style: _textStyle,
            ),
            Consumer(builder: (context, ref, _) {
              final therapistNameState = ref.watch(therapistNameProvider);
              return therapistNameState.easyWhen(
                  isLinear: true,
                  errorWidget: (error, stackTrace) =>
                      const LinearProgressIndicator(),
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
                          return DropdownButtonFormField<AllStaffs>(
                              isExpanded: true,
                              value: selectedStaff,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                enabled: false,
                                border: InputBorder.none,
                                fillColor: Theme.of(context).focusColor,
                              ),
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
            gapH12,
            Text(
              "Reason",
              style: _textStyle,
            ),
            Consumer(builder: (context, ref, _) {
              final reasonState = ref.watch(reasonProvider);
              return reasonState.easyWhen(
                  isLinear: true,
                  errorWidget: (error, stackTrace) =>
                      const LinearProgressIndicator(),
                  data: (value) {
                    final reasons = value.reasons;
                    return DropdownButtonFormField<Reasons>(
                        isExpanded: true,
                        hint: const Text("Select Reason"),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          enabled: false,
                          border: InputBorder.none,
                          fillColor: Theme.of(context).focusColor,
                        ),
                        validator: (p0) {
                          if (p0 != null && p0.reasonName!.isNotEmpty) {
                            return null;
                          }
                          return "Reason is required";
                        },
                        items: reasons
                                ?.map((reason) => DropdownMenuItem<Reasons>(
                                    value: reason,
                                    child: Text(reason.reasonName ?? "")))
                                .toList() ??
                            [],
                        onChanged: (newValue) {
                          reasonValue.value = newValue!.reasonCode;
                        });
                  });
            }),
            gapH12,
            Consumer(builder: (context, ref, _) {
              return SessionRescheduleButton(onSubmit: () {
                if (!_formKey.currentState!.validate()) return;
                if (therapistValue.value != null &&
                    reasonValue.value != null &&
                    timeValue.value != null) {
                  dashboardController.sessionRescdule(
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

  final _textStyle = const TextStyle(fontWeight: FontWeight.w600);
  Widget boxWidget({required BuildContext context, required String title}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          color: Theme.of(context).focusColor),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Text(title),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/reason_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/therapist_name_provider.dart';
import 'package:theraman/src/features/dashboard/model/executive/reason_model.dart';
import 'package:theraman/src/features/dashboard/model/executive/therapist_name_model.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/change_therapist_button.dart';

import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ChangeTherapistRoute")
class ChangeTherapistScreen extends StatelessWidget {
  final AllotSlots allotSlots;
  ChangeTherapistScreen({super.key, required this.allotSlots});

  final therapistValue = ValueNotifier<String?>(null);
  final reasonValue = ValueNotifier<String?>(null);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final dashboardController = EDashboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Therapist"),
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
            gap12,
            Text(
              "Therapist Name",
              style: _textStyle,
            ),
            boxWidget(
                context: context, title: allotSlots.rSDoctorName.toString()),
            gap12,
            Text(
              "Therapy Type",
              style: _textStyle,
            ),
            boxWidget(
                context: context, title: allotSlots.rSSlotType.toString()),
            gap12,
            Text(
              "Session Type",
              style: _textStyle,
            ),
            boxWidget(
                context: context, title: allotSlots.rSSessionType.toString()),
            gap12,
            Text(
              "Slot Time",
              style: _textStyle,
            ),
            boxWidget(
                context: context,
                title: "${allotSlots.rSStartTime} -- ${allotSlots.rSEndTime}"
                    .toString()),
            gap12,
            Text(
              "Therapist",
              style: _textStyle,
            ),
            Consumer(builder: (context, ref, _) {
              final reasonState = ref.watch(therapistNameProvider);
              return reasonState.easyWhen(
                  isLinear: true,
                  errorWidget: (error, stackTrace) =>
                      const LinearProgressIndicator(),
                  data: (value) {
                    final staffs = value.allStaffs;
                    return DropDownButtonFormFieldWidget<AllStaffs>(
                        hintText: const Text("Select Therapist"),
                        validator: (p0) {
                          if (p0 != null && p0.staffName!.isNotEmpty) {
                            return null;
                          }
                          return "Therapist is required";
                        },
                        items: staffs
                                ?.map((staff) => DropdownMenuItem<AllStaffs>(
                                    value: staff,
                                    child: Text(staff.staffName ?? "")))
                                .toList() ??
                            [],
                        onChanged: (newValue) {
                          therapistValue.value = newValue!.staffCode;
                        });
                  });
            }),
            gap12,
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
            gap12,
            Consumer(builder: (context, ref, _) {
              return ChangeTherapistButton(onSubmit: () {
                if (!_formKey.currentState!.validate()) return;
                dashboardController.changeTherapist(
                    context: context,
                    ref: ref,
                    slotId: allotSlots.rSSlotId ?? 0,
                    reason: reasonValue.value.toString(),
                    therapistName: therapistValue.value.toString());
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

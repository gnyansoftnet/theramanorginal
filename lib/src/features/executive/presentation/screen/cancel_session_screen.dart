import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/provider/reason_provider.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/features/executive/presentation/controller/e_dashboard_controller.dart';
import 'package:theraman/src/features/executive/presentation/widget/cancel_session_button.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "CancelSessionRoute")
class CancelSessionScreen extends StatelessWidget {
  final AllotSlots allotSlots;
  CancelSessionScreen({super.key, required this.allotSlots});
  final dashboardController = EDashboardController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final reasonValue = ValueNotifier<String?>(null);
  final adjustableValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancel Session"),
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
              "Is Session Adjustable ?",
              style: _textStyle,
            ),
            gap4,
            DropDownButtonFormFieldWidget(
              hintText: const Text("Select"),
              validator: (p0) {
                if (p0 != null && p0.isNotEmpty) {
                  return null;
                }
                return "Is session adjustable required";
              },
              items: ["Yes", "No"].map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (newValue) {
                adjustableValue.value = newValue!;
              },
            ),
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
                          items: const [],
                          validator: (p0) {
                            if (p0 != null) {
                              return null;
                            }
                            return "Reason is required";
                          },
                          onChanged: (newValue) {}),
                  loadingWidget: () => DropDownButtonFormFieldWidget(
                      hintText: const Text("Select Reason"),
                      items: const [],
                      validator: (p0) {
                        if (p0 != null) {
                          return null;
                        }
                        return "Reason is required";
                      },
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
            gap16,
            Consumer(builder: (context, ref, _) {
              return CancelSessionButton(onSubmit: () {
                if (!_formKey.currentState!.validate()) return;
                dashboardController.cancelSession(
                    context: context,
                    ref: ref,
                    slotId: allotSlots.rSSlotId ?? 0,
                    reason: reasonValue.value.toString(),
                    isAdjustable: adjustableValue.value.toString());
              });
            })
          ],
        ),
      ),
    );
  }

  final _textStyle = const TextStyle(fontWeight: FontWeight.bold);
}

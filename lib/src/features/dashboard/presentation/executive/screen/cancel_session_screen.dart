import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/reason_provider.dart';
import 'package:theraman/src/features/dashboard/model/executive/reason_model.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/widget/cancel_session_button.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
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
              "Is Session Adjustable ?",
              style: _textStyle,
            ),
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
            gapH16,
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

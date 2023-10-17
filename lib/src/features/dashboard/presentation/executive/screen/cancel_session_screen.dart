import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "CancelSessionRoute")
class CancelSessionScreen extends StatelessWidget {
  final AllotSlots allotSlots;
  const CancelSessionScreen({super.key, required this.allotSlots});

  final _textStyle = const TextStyle(fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Text(
            "Patient Name",
            style: _textStyle,
          ),
          gapH4,
          boxWidget(context: context, title: allotSlots.rSPName.toString()),
          gapH12,
          Text(
            "Therapist Name",
            style: _textStyle,
          ),
          gapH4,
          boxWidget(
              context: context, title: allotSlots.rSDoctorName.toString()),
          gapH12,
          Text(
            "Therapy Type",
            style: _textStyle,
          ),
          gapH4,
          boxWidget(context: context, title: allotSlots.rSSlotType.toString()),
          gapH12,
          Text(
            "Session Type",
            style: _textStyle,
          ),
          gapH4,
          boxWidget(
              context: context, title: allotSlots.rSSessionType.toString()),
          gapH12,
          Text(
            "Slot Time",
            style: _textStyle,
          ),
          gapH4,
          boxWidget(
              context: context,
              title: "${allotSlots.rSStartTime} -- ${allotSlots.rSEndTime}"
                  .toString()),
        ],
      ),
    );
  }

  Widget boxWidget({required BuildContext context, required String title}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).focusColor),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(title),
      ),
    );
  }
}

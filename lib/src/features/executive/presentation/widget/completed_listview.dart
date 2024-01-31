import 'package:flutter/material.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

class CompletedListView extends StatelessWidget {
  final AllotSlots data;
  const CompletedListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: AppColors.green,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${data.rSPName}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context).cardColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${data.rSSlotType}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${data.rSSessionType}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${data.rSStartTime}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${data.rSDoctorName}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

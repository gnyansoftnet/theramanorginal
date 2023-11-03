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
      elevation: 5.0,
      color: AppColors.green,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
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
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${data.rSSlotType}",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
                Text(
                  "${data.rSSessionType}",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${data.rSStartTime}",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Text(
                  "${data.rSDoctorName}",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
            // ListTile(
            //   dense: true,
            //   visualDensity: const VisualDensity(vertical: -3),
            //   leading: Text(
            //     "${data.rSPName}",
            //     style: TextStyle(
            //         color: AppColors.white,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17),
            //   ),
            // ),
            // ListTile(
            //   dense: true,
            //   visualDensity: const VisualDensity(vertical: -3),
            //   leading: SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: Text(
            //       "${data.rSSlotType}",
            //       style: TextStyle(
            //           color: AppColors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 13),
            //     ),
            //   ),
            //   trailing: SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: Text(
            //       "${data.rSSessionType}",
            //       style: TextStyle(
            //           color: AppColors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 13),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   dense: true,
            //   visualDensity: const VisualDensity(vertical: -3),
            //   leading: SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: Text(
            //       "${data.rSStartTime}",
            //       style: TextStyle(
            //           color: AppColors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 12),
            //     ),
            //   ),
            //   trailing: SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: Text(
            //       "${data.rSDoctorName}",
            //       style: TextStyle(
            //           color: AppColors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 12),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

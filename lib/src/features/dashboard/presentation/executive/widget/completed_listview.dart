import 'package:flutter/material.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';

class CompletedListView extends StatelessWidget {
  final AllotSlots data;
  const CompletedListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: AppColors.green,
      child: Column(
        children: [
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -3),
            leading: Text(
              "${data.rSPName}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -3),
            leading: Text(
              "${data.rSSlotType}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
            trailing: Text(
              "${data.rSSessionType}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -3),
            leading: Text(
              "${data.rSStartTime}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            trailing: Text(
              "${data.rSDoctorName}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

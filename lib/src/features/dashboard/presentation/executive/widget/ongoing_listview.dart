import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';

class OngoingListview extends StatelessWidget {
  final AllotSlots data;
  const OngoingListview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: data.rSSlotStatus == "Started"
          ? AppColors.blue
          : data.rSSessionType == "Adjustment"
              ? AppColors.teal
              : data.rSActionStatus == "Rescheduled"
                  ? const Color(0xffb467ed)
                  : data.rSActionStatus == "Change Therapist"
                      ? Colors.orange
                      : AppColors.cyan,
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(right: 0, left: 14),
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            leading: Text(
              "${data.rSPName}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            trailing: PopupMenuButton(
              color: AppColors.white,
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                PopupMenuItem(
                    child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    context
                        .navigateTo(SessionRescheduleRoute(allotSlots: data));
                  },
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.change_circle),
                  title: const Text("Session Reschedule"),
                )),
                PopupMenuItem(
                    child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    context.navigateTo(ChangeTherapistRoute(allotSlots: data));
                  },
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.group),
                  title: const Text("Change Therapist"),
                )),
                PopupMenuItem(
                    child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    context.navigateTo(CancelSessionRoute(allotSlots: data));
                  },
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.cancel),
                  title: const Text(" Session Cancellation"),
                )),
              ],
            ),
          ),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
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
            visualDensity: const VisualDensity(vertical: -4),
            leading: Text(
              "${data.rSStartTime}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            trailing: Text(
              "${data.rSSlotStatus}",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            leading: Text(
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

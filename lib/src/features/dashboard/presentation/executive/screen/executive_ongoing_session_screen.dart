import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/alloted_slot_all_therapist_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/exe_complete_session_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/exe_start_session_provider.dart';
import 'package:theraman/src/features/dashboard/presentation/executive/controller/e_dashboard_controller.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExecutiveOngoingSessionRoute")
class ExecutiveOngoingSessionScreen extends ConsumerWidget {
  ExecutiveOngoingSessionScreen({super.key});

  final eDashboardControlller = EDashboardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(allotedSlotAllTherapistProvider);

    ref.listen(
      exeStartSessionProvider,
      (previous, next) async {
        if (next is AsyncLoading) {
          /// show loading dialog
          await context.router.navigate(const LoadingDialogRoute());
        } else if (previous is AsyncLoading && next is AsyncData) {
          /// on success hide loading dialog
          /// need to complete the flow
          if (context.router.current.name ==
              const LoadingDialogRoute().routeName) {
            context.popRoute();
          }

          /// on success refresh list
          /// to get updated slot
          ref.invalidate(allotedSlotAllTherapistProvider);

          // final snackBar = SnackBar(
          //   content: const Text("Cancelled Session"),
          //   action: SnackBarAction(
          //     label: "Cancel",
          //     onPressed: () {
          //       context.hideSnackBar();
          //     },
          //   ),
          // );

          /// show snackbar
          // context.showSnackBar(snackBar);
        } else if (previous is AsyncLoading && next is AsyncError) {
          if (context.router.current.name ==
              const LoadingDialogRoute().routeName) {
            context.popRoute();
          }

          /// clear all previous snackbars
          context.clearSnackBar();

          /// error snackbar
          final snackBar = SnackBar(
            content: const Text("Failed to cancel session"),
            action: SnackBarAction(
              label: "Cancel",
              onPressed: () {
                context.hideSnackBar();
              },
            ),
          );

          /// show error snackbar
          context.showSnackBar(snackBar);
        }
      },
    );
    ref.listen(
      exeCompleteSessionProvider,
      (previous, next) async {
        if (next is AsyncLoading) {
          /// show loading dialog
          await context.router.navigate(const LoadingDialogRoute());
        } else if (previous is AsyncLoading && next is AsyncData) {
          /// on success hide loading dialog
          /// need to complete the flow
          context.popRoute();
          if (context.router.current.name ==
              const LoadingDialogRoute().routeName) {
            context.popRoute();
          }

          /// on success refresh list
          /// to get updated slot
          ref.invalidate(allotedSlotAllTherapistProvider);

          // final snackBar = SnackBar(
          //   content: const Text("Cancelled Session"),
          //   action: SnackBarAction(
          //     label: "Cancel",
          //     onPressed: () {
          //       context.hideSnackBar();
          //     },
          //   ),
          // );

          /// show snackbar
          // context.showSnackBar(snackBar);
        } else if (previous is AsyncLoading && next is AsyncError) {
          if (context.router.current.name ==
              const LoadingDialogRoute().routeName) {
            context.popRoute();
          }

          /// clear all previous snackbars
          context.clearSnackBar();

          /// error snackbar
          final snackBar = SnackBar(
            content: const Text("Failed to cancel session"),
            action: SnackBarAction(
              label: "Cancel",
              onPressed: () {
                context.hideSnackBar();
              },
            ),
          );

          /// show error snackbar
          context.showSnackBar(snackBar);
        }
      },
    );

    return Scaffold(
      body: allotedSlotState.easyWhen(onRetry: () {
        ref.invalidate(allotedSlotAllTherapistProvider);
      }, data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(allotedSlotAllTherapistProvider);
            },
            child: value.allotSlots!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/blank.svg",
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).height / 3,
                        ),
                        gapH8,
                        ElevatedButton(
                            onPressed: () {
                              ref.invalidate(allotedSlotAllTherapistProvider);
                            },
                            child: const Text("Retry"))
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
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
                              contentPadding:
                                  const EdgeInsets.only(right: 0, left: 14),
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
                                itemBuilder: (context) =>
                                    <PopupMenuEntry<String>>[
                                  PopupMenuItem(
                                      child: ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      context.navigateTo(SessionRescheduleRoute(
                                          allotSlots: data));
                                    },
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: const Icon(Icons.change_circle),
                                    title: const Text("Session Reschedule"),
                                  )),
                                  PopupMenuItem(
                                      child: ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      context.navigateTo(ChangeTherapistRoute(
                                          allotSlots: data));
                                    },
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: const Icon(Icons.group),
                                    title: const Text("Change Therapist"),
                                  )),
                                  PopupMenuItem(
                                      child: ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      context.navigateTo(
                                          CancelSessionRoute(allotSlots: data));
                                    },
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: const Icon(Icons.cancel),
                                    title: const Text(" Session Cancellation"),
                                  )),
                                  PopupMenuItem(
                                      child: ListTile(
                                    onTap: data.rSSlotStatus != "Started"
                                        ? () {
                                            Navigator.pop(context);
                                            eDashboardControlller
                                                .exeStartSession(
                                                    context: context,
                                                    ref: ref,
                                                    slotId: data.rSSlotId ?? 0);
                                          }
                                        : () {
                                            Navigator.pop(context);
                                            eDashboardControlller
                                                .exeCompleteSession(
                                                    context: context,
                                                    ref: ref,
                                                    slotId: data.rSSlotId ?? 0);
                                          },
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: const Icon(Icons.done),
                                    title: Text(data.rSSlotStatus != "Started"
                                        ? "Start Session"
                                        : "Complete Session"),
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
                    }),
          ),
        );
      }),
    );
  }
}

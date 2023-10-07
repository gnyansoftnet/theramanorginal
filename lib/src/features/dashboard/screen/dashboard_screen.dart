import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/application/providers/dashboard_provider.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alloted Slots"),
        centerTitle: true,
      ),
      body: allotedSlotState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dashboardProvider);
            },
            child: value.allotSlots!.isEmpty
                ? const Center(
                    child: AutoSizeText("No Slot Found"),
                  )
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: value.allotSlots!.length,
                    itemBuilder: (context, index) {
                      final data = value.allotSlots![index];
                      return Card(
                        elevation: 5.0,
                        color: data.rSSlotStatus == "Started"
                            ? Colors.blue.withOpacity(0.6)
                            : data.rSSlotStatus == "Completed"
                                ? Colors.green
                                : Theme.of(context).cardColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "${data.rSPName}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: data.rSSlotStatus ==
                                                    "Yet To Start"
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      AutoSizeText(
                                        "${data.rSSlotType}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: data.rSSlotStatus ==
                                                    "Yet To Start"
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -1),
                              leading: AutoSizeText(
                                "${data.rSStartTime}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: data.rSSlotStatus == "Yet To Start"
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 15),
                              ),
                              trailing: data.rSSlotStatus == "Completed"
                                  ? const AutoSizeText(
                                      "Completed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white),
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 5.0,
                                          backgroundColor: data.rSSlotStatus ==
                                                  "Yet To Start"
                                              ? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.9)
                                              : Theme.of(context).cardColor,
                                          minimumSize: const Size(120, 42)),
                                      onPressed: () async {
                                        await session(
                                            context: context,
                                            ref: ref,
                                            status:
                                                data.rSSlotStatus.toString(),
                                            rsSlotId: data.rSSlotId.toString());
                                      },
                                      child: AutoSizeText(
                                        data.rSSlotStatus == "Yet To Start"
                                            ? "Start"
                                            : data.rSSlotStatus == "Started"
                                                ? "Complete"
                                                : "Completed",
                                        style: TextStyle(
                                            color: data.rSSlotStatus ==
                                                    "Yet To Start"
                                                ? Colors.white
                                                : Colors.blue),
                                      ),
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

  Future<void> session({
    required BuildContext context,
    required WidgetRef ref,
    required String rsSlotId,
    required String status,
  }) async {
    if (status == "Started") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const AutoSizeText("Are you want to complete"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("No")),
                TextButton(
                    onPressed: () async {
                      await ref
                          .read(completeSessionProvider.notifier)
                          .completeSession(rsSlotId);
                      ref.invalidate(dashboardProvider);
                      if (context.mounted) Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("Yes")),
              ],
            );
          });
    } else if (status == "Yet To Start") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const AutoSizeText("Are you want to start"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("No")),
                TextButton(
                    onPressed: () async {
                      await ref
                          .read(startSessionProvider.notifier)
                          .startSession(rsSlotId);
                      ref.invalidate(dashboardProvider);
                      if (context.mounted) Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("Yes")),
              ],
            );
          });
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/tomorrow_session_provider.dart';
import 'package:theraman/src/global/widgets/empty_widget.dart';
import 'package:theraman/src/global/widgets/widget.dart';
import 'package:theraman/src/utils/constants/constant.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

@RoutePage(deferredLoading: true, name: "TomorrowSessionRoute")
class TomorrowSessionScreen extends ConsumerWidget {
  TomorrowSessionScreen({super.key});
  final _dateController = TextEditingController(
      text: DateFormat('MM/dd/yyyy')
          .format(DateTime.now().add(const Duration(days: 1))));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState =
        ref.watch(tomorrowSessionProvider(_dateController.text.trim()));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomorrow Session"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      drawer: const DrawerWidget(currentPage: "TomorrowSessionRoute"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                      controller: _dateController,
                      preFixIcon: const Icon(Icons.calendar_month),
                      readOnly: true,
                      onFieldSubmitted: (value) {},
                      validator: FormValidators.requiredWithFieldName(
                              "Date is required")
                          .call,
                      onTap: () async {
                        await DateTimeExtension.showDate(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate:
                              DateTime.now().add(const Duration(days: 1)),
                          lastDate: DateTime(DateTime.now().year + 1),
                        ).then((value) {
                          _dateController.text =
                              DateFormat('MM/dd/yyy').format(value);
                          ref.watch(tomorrowSessionProvider(
                              _dateController.text.trim()));
                        });
                      },
                      hint: "MM/DD/YYY"),
                ),
                gap4,
                ElevatedButton(
                    onPressed: () async {
                      ref.watch(tomorrowSessionProvider(_dateController.text));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 4.0,
                        padding: const EdgeInsets.all(17),
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.zero))),
                    child: const Text("SEARCH"))
              ],
            ),
            Expanded(
              child: tomorrowSessionState.easyWhen(data: (value) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(tomorrowSessionProvider);
                  },
                  child: value.allotSlots!.isEmpty
                      ? EmptyWidget(onPressed: () {
                          ref.invalidate(tomorrowSessionProvider);
                        })
                      : ListView.builder(
                          itemCount: value.allotSlots!.length,
                          itemBuilder: ((context, index) {
                            final data = value.allotSlots![index];
                            return Card(
                              elevation: 4.0,
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -1),
                                    leading: Text(
                                      "${data.rSPName}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -1),
                                    leading: Text(
                                      "${data.rSSlotType}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    trailing: Text(
                                      "${data.rSStartTime}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

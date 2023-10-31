import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/session_summary_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "SessionReportRoute")
class SessionReport extends ConsumerWidget {
  SessionReport({super.key});
  final _dropDowndateValue = ValueNotifier<String>("Current Month");
  List monthList = ["Current Month", "Last Month"];

  final _textStyele = const TextStyle(fontWeight: FontWeight.bold);
  final _styleFigure =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionSummaryState =
        ref.watch(sessionSummaryProvider(_dropDowndateValue.value));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Session Report"),
          actions: [
            IconButton(
                onPressed: () {
                  context.router.replaceAll([DashboardRoute()]);
                },
                icon: const Icon(Icons.home))
          ],
        ),
        drawer: const DrawerWidget(currentPage: "SessionReportRoute"),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: ValueListenableBuilder(
                      valueListenable: _dropDowndateValue,
                      builder: (context, value, child) {
                        return GestureDetector(
                          child: DropDownButtonFormFieldWidget(
                              value: _dropDowndateValue.value,
                              items: monthList
                                  .map((month) => DropdownMenuItem<String>(
                                      value: month, child: Text(month)))
                                  .toList(),
                              onChanged: (newValue) {
                                _dropDowndateValue.value = newValue!;
                                ref.watch(sessionSummaryProvider(newValue));
                              }),
                        );
                      }),
                ),
                gapH12,
                Expanded(child: sessionSummaryState.easyWhen(data: (value) {
                  return ListView.builder(
                      itemCount: value.sessionSummary!.length,
                      itemBuilder: (context, index) {
                        final data = value.sessionSummary![index];
                        return DecoratedBox(
                          decoration: BoxDecoration(border: Border.all()),
                          child: Card(
                            elevation: 0,
                            borderOnForeground: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            child: Column(
                              children: [
                                gapH8,
                                ListTile(
                                  dense: true,
                                  visualDensity:
                                      const VisualDensity(vertical: -1),
                                  leading: Column(
                                    children: [
                                      Text("Total Alloted", style: _textStyele),
                                      Text(
                                        "${data.totalAllotted}",
                                        style: _styleFigure,
                                      ),
                                    ],
                                  ),
                                  trailing: Column(
                                    children: [
                                      Text("Total Taken", style: _textStyele),
                                      Text(
                                        "${data.totalTaken}",
                                        style: _styleFigure,
                                      ),
                                    ],
                                  ),
                                ),
                                gapH12,
                                ListTile(
                                  dense: true,
                                  visualDensity:
                                      const VisualDensity(vertical: 0),
                                  leading: Column(
                                    children: [
                                      Text("Total Cancelled",
                                          style: _textStyele),
                                      Text(
                                        "${data.totalCancelled}",
                                        style: _styleFigure,
                                      ),
                                    ],
                                  ),
                                  trailing: Column(
                                    children: [
                                      Text("Total Assesment",
                                          style: _textStyele),
                                      Text(
                                        "${data.totalAssessment}",
                                        style: _styleFigure,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                })),
                // Expanded(
                //     flex: 3,
                //     child: sessionSummaryState.easyWhen(data: (value) {
                //       return ListView.builder(
                //           itemCount: 10,
                //           itemBuilder: (context, index) {
                //             return DataTable(
                //               columnSpacing: 10,
                //               columns: const [
                //                 DataColumn(label: Text('1')),
                //                 DataColumn(label: Text('Allotted')),
                //                 DataColumn(label: Text('Taken')),
                //                 DataColumn(label: Text('Cancelled')),
                //                 DataColumn(label: Text('Assessment')),
                //               ],
                //               rows: const [
                //                 DataRow(cells: [
                //                   DataCell(Text('2')),
                //                   DataCell(Text('10')),
                //                   DataCell(Text('2')),
                //                   DataCell(Text('8')),
                //                   DataCell(Text('6')),
                //                 ]),
                //               ],
                //             );
                //           });
                //     }))
              ],
            )));
  }

  Widget boxField({
    required BuildContext context,
    required String text,
    required IconData icon,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).focusColor),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }
}

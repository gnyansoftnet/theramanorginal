import 'package:auto_route/auto_route.dart';
// import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/session_summary_detail_provider.dart';
import 'package:theraman/src/features/therapist/application/providers/session_summary_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/global/widgets/dropdown_button_formfield_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "SessionReportRoute")
class SessionReport extends ConsumerWidget {
  SessionReport({super.key});
  final _dropDowndateValue = ValueNotifier<String>("Current Month");
  final List monthList = ["Current Month", "Last Month"];

  final _textStyele = const TextStyle(fontWeight: FontWeight.bold);
  final _styleFigure =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionSummaryState =
        ref.watch(sessionSummaryProvider(_dropDowndateValue.value));
    final sessionSummaryDetailState =
        ref.watch(sessionSummaryDetailProvider(_dropDowndateValue.value));
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
                        // ref.watch(sessionSummaryProvider(value));
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
                gap12,
                Expanded(
                    child: sessionSummaryState.easyWhen(onRetry: () {
                  ref.invalidate(sessionSummaryProvider);
                }, data: (value) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(sessionSummaryProvider);
                    },
                    child: ListView.builder(
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
                                  gap8,
                                  ListTile(
                                    dense: true,
                                    visualDensity:
                                        const VisualDensity(vertical: -1),
                                    leading: Column(
                                      children: [
                                        Text("Total Alloted",
                                            style: _textStyele),
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
                                  gap12,
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
                        }),
                  );
                })),
                gap12,
                Expanded(
                    flex: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: _dropDowndateValue,
                            builder: (context, value, child) {
                              debugPrint("value=====$value");
                              return Text(
                                "Session Details of ${value == "Current Month" ? DateFormat.yMMMM().format(DateTime.now()) : DateFormat.yMMMM().format(DateTime(DateTime.now().year, DateTime.now().month - 1))}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            })
                      ],
                    )),
                gap12,
                Expanded(
                    flex: 3,
                    child:
                        sessionSummaryDetailState.easyWhen(onRetry: () async {
                      ref.invalidate(sessionSummaryDetailProvider);
                    }, data: (value) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          ref.invalidate(sessionSummaryDetailProvider);
                        },
                        child: SingleChildScrollView(
                          child: DataTable(
                              border: const TableBorder(
                                  left: BorderSide(),
                                  right: BorderSide(),
                                  bottom: BorderSide(),
                                  top: BorderSide()),
                              headingTextStyle: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),
                              headingRowColor:
                                  MaterialStateProperty.resolveWith((states) =>
                                      Theme.of(context).primaryColor),
                              columnSpacing: 10,
                              // horizontalMargin: 12,
                              // minWidth: 250,
                              // dividerThickness: 1,
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Date',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Alloted',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Taken',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Cancelled',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Assesment',
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                  value.sessionDtl!.length,
                                  (index) => DataRow(
                                          color: MaterialStateProperty
                                              .resolveWith((states) => value
                                                          .sessionDtl![index]
                                                          .isSunday ==
                                                      "Y"
                                                  ? Theme.of(context)
                                                      .focusColor
                                                      .withOpacity(0.5)
                                                  : Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                          cells: [
                                            DataCell(Text(
                                              "${value.sessionDtl![index].allotDay}",
                                              style: TextStyle(
                                                  color:
                                                      value.sessionDtl![index]
                                                                  .isSunday ==
                                                              "Y"
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataCell(Text(
                                              "${value.sessionDtl![index].allotted}",
                                              style: TextStyle(
                                                  color:
                                                      value.sessionDtl![index]
                                                                  .isSunday ==
                                                              "Y"
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataCell(Text(
                                              "${value.sessionDtl![index].taken}",
                                              style: TextStyle(
                                                  color:
                                                      value.sessionDtl![index]
                                                                  .isSunday ==
                                                              "Y"
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataCell(Text(
                                              "${value.sessionDtl![index].cancelled}",
                                              style: TextStyle(
                                                  color:
                                                      value.sessionDtl![index]
                                                                  .isSunday ==
                                                              "Y"
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataCell(Text(
                                              "${value.sessionDtl![index].assessment}",
                                              style: TextStyle(
                                                  color:
                                                      value.sessionDtl![index]
                                                                  .isSunday ==
                                                              "Y"
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ]))),
                        ),
                      );
                    }))
              ],
            )));
  }
}

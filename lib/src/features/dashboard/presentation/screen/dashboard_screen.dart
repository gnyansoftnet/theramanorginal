import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/presentation/screen/completed_session_screen.dart';
import 'package:theraman/src/features/dashboard/presentation/screen/ongoing_session_screen.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const AutoSizeText("DashBoard"),
            bottom: const TabBar(tabs: [
              Tab(
                child: AutoSizeText(
                  "ONGOING",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "COMPLETED",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          drawer: const DrawerWidget(currentPage: "dashboardPage"),
          body: TabBarView(
            children: [
              const OnGoingSessionScreen(),
              CompletedSessionScreen(),
            ],
          )),
    );
  }
}

// allotedSlotState.easyWhen(data: (value) {
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: RefreshIndicator(
//               onRefresh: () async {
//                 ref.invalidate(dashboardProvider);
//               },
//               child: value.allotSlots!.isEmpty
//                   ? const Center(
//                       child: AutoSizeText("No Slot Found"),
//                     )
//                   : ListView.builder(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       itemCount: value.allotSlots!.length,
//                       itemBuilder: (context, index) {
//                         final data = value.allotSlots![index];
//                         return Card(
//                           elevation: 5.0,
//                           color: data.rSSlotStatus == "Started"
//                               ? Colors.blue
//                               : data.rSSlotStatus == "Completed"
//                                   ? Colors.green
//                                   : Theme.of(context).cardColor,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 12, top: 10),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         AutoSizeText(
//                                           "${data.rSPName}",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: data.rSSlotStatus ==
//                                                       "Yet To Start"
//                                                   ? Colors.black
//                                                   : Colors.white,
//                                               fontSize: 17),
//                                         ),
//                                         const SizedBox(
//                                           height: 9,
//                                         ),
//                                         AutoSizeText(
//                                           "${data.rSSlotType}",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: data.rSSlotStatus ==
//                                                       "Yet To Start"
//                                                   ? Colors.black
//                                                   : Colors.white,
//                                               fontSize: 13),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               ListTile(
//                                 visualDensity:
//                                     const VisualDensity(vertical: -1),
//                                 leading: AutoSizeText(
//                                   "${data.rSStartTime}",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: data.rSSlotStatus == "Yet To Start"
//                                           ? Colors.black
//                                           : Colors.white,
//                                       fontSize: 15),
//                                 ),
//                                 trailing: data.rSSlotStatus == "Completed"
//                                     ? const AutoSizeText(
//                                         "Completed",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 13,
//                                             color: Colors.white),
//                                       )
//                                     : ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                             elevation: 4.0,
//                                             backgroundColor: data
//                                                         .rSSlotStatus ==
//                                                     "Yet To Start"
//                                                 ? Theme.of(context)
//                                                     .primaryColor
//                                                     .withOpacity(0.9)
//                                                 : Theme.of(context).canvasColor,
//                                             minimumSize: const Size(120, 42)),
//                                         onPressed: () async {
//                                           await dashoardController.session(
//                                               context: context,
//                                               ref: ref,
//                                               status:
//                                                   data.rSSlotStatus.toString(),
//                                               rsSlotId:
//                                                   data.rSSlotId.toString());
//                                         },
//                                         child: AutoSizeText(
//                                           data.rSSlotStatus == "Yet To Start"
//                                               ? "Start"
//                                               : data.rSSlotStatus == "Started"
//                                                   ? "Complete"
//                                                   : "Completed",
//                                           style: TextStyle(
//                                               color: data.rSSlotStatus ==
//                                                       "Yet To Start"
//                                                   ? Colors.white
//                                                   : Colors.blue),
//                                         ),
//                                       ),
//                               )
//                             ],
//                           ),
//                         );
//                       }
//                       ),
//             ),
//           );
//         }
//         ),

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

import '../../application/providers/user_provider.dart';

@RoutePage(deferredLoading: true, name: "TomorrowSessionRoute")
class TomorrowSessionScreen extends ConsumerWidget {
  const TomorrowSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState = ref.watch(tomorrowSessionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText("Tomorrow Session"),
      ),
      drawer: const DrawerWidget(currentPage: "TomorrowSessionRoute"),
      body: tomorrowSessionState.easyWhen(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(tomorrowSessionProvider);
            },
            child: value.allotSlots!.isEmpty
                ? const Center(
                    child: AutoSizeText("you dont have any slot for tomorrow"),
                  )
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
                              visualDensity: const VisualDensity(vertical: -1),
                              leading: AutoSizeText(
                                "${data.rSPName}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -1),
                              leading: AutoSizeText(
                                "${data.rSSlotType}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              trailing: AutoSizeText(
                                "${data.rSStartTime}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
          ),
        );
      }),
    );
  }
}

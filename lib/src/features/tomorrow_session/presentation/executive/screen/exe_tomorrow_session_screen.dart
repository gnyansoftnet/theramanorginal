import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/tomorrow_session/application/executive/provider/exe_tomorrow_session_provider.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "ExeTomorrowSessionRoute")
class ExeTomorrowSessionScreen extends ConsumerWidget {
  const ExeTomorrowSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tomorrowSessionState = ref.watch(exeTomorrowSessionProvider);
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerWidget(currentPage: "ExeTomorrowSessionRoute"),
      body: tomorrowSessionState.easyWhen(data: (value) {
        return ListView.builder(
            itemCount: value.nextDaySlots!.length,
            itemBuilder: (context, index) {
              final data = value.nextDaySlots![index];
              return Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -1),
                      leading: Text(
                        "${data.rSPName}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -1),
                      leading: Text(
                        "${data.rSSlotType}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      trailing: Text(
                        "${data.rSStartTime}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}

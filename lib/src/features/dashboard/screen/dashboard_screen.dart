import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/application/providers/dashboard_provider.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "DashboardRoute")
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allotedSlotState = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(),
      body: allotedSlotState.easyWhen(data: (value) {
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(dashboardProvider);
          },
          child: ListView.builder(
              // separatorBuilder: (_, __) => const Divider(),
              itemCount: value.allotSlots!.length,
              itemBuilder: (context, index) {
                final data = value.allotSlots![index];
                return Card(
                  child: ListTile(
                      leading: AutoSizeText(
                        "${data.rSStartTime}",
                        style: const TextStyle(fontSize: 10),
                      ),
                      title: AutoSizeText(
                        "${data.rSPName}",
                        style: const TextStyle(fontSize: 5),
                      ),
                      subtitle: AutoSizeText("${data.rSSlotType}"),
                      trailing: ElevatedButton(
                          onPressed: () {},
                          child: const AutoSizeText("Start"))),
                );
              }),
        );
      }),
    );
  }
}

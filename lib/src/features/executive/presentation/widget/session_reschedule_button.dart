import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/provider/session_reschedule_provider.dart';
import 'package:theraman/src/features/executive/application/states/session_reschedule_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class SessionRescheduleButton extends ConsumerWidget {
  const SessionRescheduleButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionRescheduleButtonState = ref.watch(sessionRescheduleProvider);

    ref.listen(
      sessionRescheduleProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            SessionRescheduleInitial() => null,
            SessionRescheduleLoading() => null,
            SessionRescheduleLoaded() => {
                context.back(),
                ref.invalidate(executiveRepoProvider)
              }
          },
          error: (e, _) {
            // /// show error snackbar
            // final snackBar = SnackBar(content: Text("$e"));
            // context.showSnackBar(snackBar);
            context.showCustomDialog(builder: (context) {
              return AlertDialog.adaptive(
                title: const Text("Warning "),
                content: Text("$e"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              );
            });
          },
          loading: () {
            // show loading dialog
          },
        );
      },
    );

    return sessionRescheduleButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          SessionRescheduleInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "RESCHEDULE",
            ),
          SessionRescheduleLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "RESCHEDULE",
            ),
          SessionRescheduleLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "RESCHEDULE",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "RESCHEDULE",
      ),
      loadingWidget: () => const ElevatedButtonWidget(
        onPressed: null,
        isChild: true,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/executive/application/provider/cancel_session_provider.dart';
import 'package:theraman/src/features/executive/application/states/cancel_session_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';
import 'package:theraman/src/utils/extensions/snackbar_ext.dart';

class CancelSessionButton extends ConsumerWidget {
  const CancelSessionButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cancelSessionButtonState = ref.watch(cancelSessionProvider);

    ref.listen(
      cancelSessionProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            CancelSessionInitial() => null,
            CancelSessionLoading() => null,
            CancelSessionLoaded() => {
                context.back(),
                ref.invalidate(executiveRepoProvider)
              }
          },
          error: (e, _) {
            /// show error snackbar
            final snackBar = SnackBar(content: Text("$e"));
            context.showSnackBar(snackBar);
          },
          loading: () {
            // show loading dialog
          },
        );
      },
    );

    return cancelSessionButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          CancelSessionInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "CANCEL SESSION",
            ),
          CancelSessionLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "CANCEL SESSION",
            ),
          CancelSessionLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "CANCEL SESSION",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "CANCEL SESSION",
      ),
      loadingWidget: () => const ElevatedButtonWidget(
        onPressed: null,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

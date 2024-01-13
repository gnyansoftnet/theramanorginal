import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/provider/change_therapist_provider.dart';
import 'package:theraman/src/features/executive/application/states/change_therapist_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class ChangeTherapistButton extends ConsumerWidget {
  const ChangeTherapistButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeTherapistButtonState = ref.watch(changeTherapistProvider);

    ref.listen(
      changeTherapistProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            ChangeTherapistInitial() => null,
            ChangeTherapistLoading() => null,
            ChangeTherapistLoaded() => {
                context.back(),
                ref.invalidate(executiveRepoProvider)
              }
          },
          error: (e, _) {
            /// show error snackbar
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

    return changeTherapistButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          ChangeTherapistInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "CHANGE",
            ),
          ChangeTherapistLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "CHANGE",
            ),
          ChangeTherapistLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "CHANGE",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "CHANGE",
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

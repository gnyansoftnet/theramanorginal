import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/cancel_session_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/states/cancel_session_state.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

class CancelSessionButton extends ConsumerWidget {
  CancelSessionButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  final _textStyle =
      TextStyle(color: AppColors.white, fontWeight: FontWeight.bold);

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
                ref.invalidate(executivedashboardRepoProvider)
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
              color: AppColors.red,
              onPressed: onSubmit,
              child: Text(
                "Cancel Session",
                style: _textStyle,
              ),
            ),
          CancelSessionLoading() => ElevatedButtonWidget(
              onPressed: null,
              color: AppColors.red,
              child: Text(
                "Cancel Session",
                style: _textStyle,
              ),
            ),
          CancelSessionLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              color: AppColors.red,
              child: Text(
                "Cancel Session",
                style: _textStyle,
              ),
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        color: AppColors.red,
        child: Text(
          "Cancel Session",
          style: _textStyle,
        ),
      ),
      loadingWidget: () => ElevatedButtonWidget(
        onPressed: null,
        color: AppColors.red,
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

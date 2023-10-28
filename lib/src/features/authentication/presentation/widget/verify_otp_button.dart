import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/login_provider.dart';
import 'package:theraman/src/features/authentication/application/states/verify_otp_states.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

class VerifyOtpButton extends ConsumerWidget {
  const VerifyOtpButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyOtpButtonState = ref.watch(verifyOtpProvider);

    ref.listen(
      verifyOtpProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            VerifyOtpInitial() => null,
            VerifyOtpLoading() => null,
            VerifyOtpLoaded() => context.router.replaceAll([DashboardRoute()]),
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

    return verifyOtpButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          VerifyOtpInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              child: const Text("Verify"),
            ),
          VerifyOtpLoading() => const ElevatedButtonWidget(
              onPressed: null,
              child: Text("Verify"),
            ),
          VerifyOtpLoaded() => const ElevatedButtonWidget(
              onPressed: null,
              child: Text("Verify"),
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        child: const Text("Verify"),
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

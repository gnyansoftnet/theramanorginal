import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/authentication/application/providers/login_provider.dart';

import 'package:theraman/src/features/authentication/application/states/send_otp_states.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

import '../../../core/routes/app_routes.gr.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submitloginButtonState = ref.watch(loginProvider);

    ref.listen(
      loginProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            SendOtpInitial() => null,
            SendOtpLoading() => null,
            SendOtpLoaded() => context.navigateTo(const VarifyOtpRoute()),
          },
          error: (e, _) {
            /// show error snackbar
            final snackBar = SnackBar(content: Text("Error: ${e.toString()}"));
            context.showSnackBar(snackBar);
          },
          loading: () {
            // show loading dialog
          },
        );
      },
    );

    return submitloginButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          SendOtpInitial() => ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Submit"),
            ),
          SendOtpLoading() => const ElevatedButton(
              onPressed: null,
              child: Text("Submit"),
            ),
          SendOtpLoaded() => const ElevatedButton(
              onPressed: null,
              child: Text("Submit"),
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButton(
        onPressed: onSubmit,
        // onPressed: () {},
        child: const Text("Submit"),
      ),
      loadingWidget: () => const ElevatedButton(
        onPressed: null,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

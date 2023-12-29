import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/send_otp_provider.dart';
import 'package:theraman/src/features/authentication/application/states/send_otp_states.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

class SendOtpButton extends ConsumerWidget {
  final TextEditingController mobileNoController;
  final String usertype;
  const SendOtpButton(
      {super.key,
      required this.onSubmit,
      required this.mobileNoController,
      required this.usertype});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submitloginButtonState = ref.watch(sendOtpProvider);

    ref.listen(
      sendOtpProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            SendOtpInitial() => null,
            SendOtpLoading() => null,
            SendOtpLoaded() => {
                context.navigateTo(VerifyOtpRoute(
                    mobileNoController: mobileNoController,
                    userType: usertype)),
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

    return submitloginButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          SendOtpInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "SEND OTP",
            ),
          SendOtpLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "SEND OTP",
            ),
          SendOtpLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "SEND OTP",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "SEND OTP",
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

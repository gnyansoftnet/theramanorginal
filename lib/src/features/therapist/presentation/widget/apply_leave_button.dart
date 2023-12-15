import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/apply_leave_provider.dart';
import 'package:theraman/src/features/therapist/application/states/apply_leave_state.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

class ApplyLeaveButton extends ConsumerWidget {
  final VoidCallback onSubmit;
  const ApplyLeaveButton({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applyLeaveState = ref.watch(applyLeaveProvider);

    ref.listen(
      applyLeaveProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            ApplyLeaveInitial() => null,
            ApplyLeaveLoading() => null,
            ApplyLeaveLoaded() => {
                Fluttertoast.showToast(
                    msg: "Your application submitted sucessfully"),
                context.navigateTo(LeaveStatusRoute()),
              },
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

    return applyLeaveState.easyWhen(
      data: (data) {
        return switch (data) {
          ApplyLeaveInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "SUBMIT",
            ),
          ApplyLeaveLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "SUBMIT",
            ),
          ApplyLeaveLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "SUBMIT",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "SUBMIT",
      ),
      loadingWidget: () => const ElevatedButtonWidget(
        onPressed: null,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

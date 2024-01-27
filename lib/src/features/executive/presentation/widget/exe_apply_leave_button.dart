import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/executive/application/provider/exe_apply_leave_provider.dart';
import 'package:theraman/src/features/executive/application/states/exe_apply_leave_state.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

class ExeApplyLeaveButton extends ConsumerWidget {
  final VoidCallback onSubmit;
  const ExeApplyLeaveButton({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exeApplyLeaveState = ref.watch(exeApplyLeaveProvider);

    ref.listen(
      exeApplyLeaveProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            ExeApplyLeaveInitial() => null,
            ExeApplyLeaveLoading() => null,
            ExeApplyLeaveLoaded() => {
                Fluttertoast.showToast(
                    msg: "Your application submitted sucessfully"),
                context.navigateTo((ExeLeaveStatusRoute())),
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

    return exeApplyLeaveState.easyWhen(
      data: (data) {
        return switch (data) {
          ExeApplyLeaveInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "APPLY",
            ),
          ExeApplyLeaveLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "APPLY",
            ),
          ExeApplyLeaveLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "APPLY",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "APPLY",
      ),
      loadingWidget: () => const ElevatedButtonWidget(
        onPressed: null,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

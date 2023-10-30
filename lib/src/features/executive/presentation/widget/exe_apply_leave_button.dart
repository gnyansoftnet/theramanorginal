import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/executive/application/provider/exe_apply_leave_provider.dart';
import 'package:theraman/src/features/executive/application/states/exe_apply_leave_state.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

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
                // context.navigateTo(LeaveStatusRoute()),
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
          ExeApplyLeaveInitial() => ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Apply"),
            ),
          ExeApplyLeaveLoading() => const ElevatedButton(
              onPressed: null,
              child: Text("Apply"),
            ),
          ExeApplyLeaveLoaded() => ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Apply"),
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButton(
        onPressed: onSubmit,
        child: const Text("Apply"),
      ),
      loadingWidget: () => const ElevatedButton(
        onPressed: null,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

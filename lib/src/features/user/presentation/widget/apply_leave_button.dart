import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/utils/extensions/common_ext/snackbar_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

import '../../application/states/apply_leave_state.dart';

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
                context.navigateTo(const LeaveStatusRoute()),
              },
          },
          error: (e, _) {
            /// show error snackbar
            const snackBar =
                SnackBar(content: Text("Error: Some thing is wrong"));
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
          ApplyLeaveInitial() => ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Submit"),
            ),
          ApplyLeaveLoading() => const ElevatedButton(
              onPressed: null,
              child: Text("Submit"),
            ),
          ApplyLeaveLoaded() => ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Submit"),
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButton(
        onPressed: onSubmit,
        child: const Text("Submit"),
      ),
      loadingWidget: () => const ElevatedButton(
        onPressed: null,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

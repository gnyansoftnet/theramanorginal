import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/profile/application/providers/change_password_provider.dart';
import 'package:theraman/src/features/profile/application/states/change_password_state.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class ChangePasswordButton extends ConsumerWidget {
  const ChangePasswordButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newJoiningButtonState = ref.watch(changePasswordPod);

    ref.listen(
      changePasswordPod,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            ChangePasswordInitial() => null,
            ChangePasswordLoading() => null,
            ChangePasswordLoaded() => {
                if (context.mounted)
                  {
                    Fluttertoast.showToast(msg: data.msg),
                    ref.read(userProvider.notifier).clearUser().then((value) {
                      if (value && context.mounted) {
                        context.router.replaceAll([const UserTypeRoute()]);
                      }
                    })
                  }
              }
          },
          error: (e, error) {
            // show error
            // context.showSnackBar(SnackContentWidget(
            //   content: "$e",
            // ));
          },
          loading: () {
            // show loading dialog
          },
        );
      },
    );

    return newJoiningButtonState.easyWhen(
        data: (data) {
          return switch (data) {
            ChangePasswordInitial() => ElevatedButtonWidget(
                onPressed: onSubmit,
                text: "PASSWORD UPDATE",
              ),
            ChangePasswordLoading() => const ElevatedButtonWidget(
                onPressed: null,
                text: "PASSWORD UPDATE",
              ),
            ChangePasswordLoaded() => ElevatedButtonWidget(
                onPressed: onSubmit,
                text: "PASSWORD UPDATE",
              ),
          };
        },
        errorWidget: (error, stackTrace) => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "PASSWORD UPDATE",
            ),
        loadingWidget: () => ElevatedButtonWidget(
              onPressed: onSubmit,
              child: CircularProgressIndicator(
                color: Theme.of(context).cardColor,
              ),
            ));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/signin_provider.dart';
import 'package:theraman/src/features/authentication/application/states/signin_state.dart';
import 'package:theraman/src/global/widgets/widget.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class SigninButton extends ConsumerWidget {
  const SigninButton({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signinButtonState = ref.watch(signinProvider);

    ref.listen(
      signinProvider,
      (previous, next) {
        next.when(
          data: (data) => switch (data) {
            SigninInitial() => null,
            SigninLoading() => null,
            SigninLoaded() => {
                if (context.mounted)
                  {
                    context.router.replaceAll([DashboardRoute()])
                  }
              }
          },
          error: (e, _) {
            // show error
            context.showSnackBar(SnackContentWidget(
              content: "$e",
            ));
          },
          loading: () {
            // show loading dialog
          },
        );
      },
    );

    return signinButtonState.easyWhen(
      data: (data) {
        return switch (data) {
          SigninInitial() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "SIGN IN",
            ),
          SigninLoading() => const ElevatedButtonWidget(
              onPressed: null,
              text: "SIGN IN",
            ),
          SigninLoaded() => ElevatedButtonWidget(
              onPressed: onSubmit,
              text: "SIGN IN",
            ),
        };
      },
      errorWidget: (error, stackTrace) => ElevatedButtonWidget(
        onPressed: onSubmit,
        text: "SIGN IN",
      ),
      loadingWidget: () => ElevatedButtonWidget(
        onPressed: null,
        child: CircularProgressIndicator(
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}

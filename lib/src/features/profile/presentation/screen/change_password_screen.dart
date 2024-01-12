import 'package:auto_route/auto_route.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/profile/application/providers/change_password_provider.dart';
import 'package:theraman/src/features/profile/presentation/comp/change_password_button.dart';
import 'package:theraman/src/global/widgets/flash_bar_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/constants/constant.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

@RoutePage(deferredLoading: true, name: "ChangePasswordRoute")
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final _currPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _currPassFocus = FocusNode();
  final _newPassFocus = FocusNode();
  final _confirmPassFocus = FocusNode();

  final _obsecureCurrPassword = ValueNotifier<bool>(true);
  final _obsecureNewPassword = ValueNotifier<bool>(true);
  final _obsecureConfirmPassword = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHANGE PASSWORD"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.horizentalPadding,
              vertical: AppDefaults.verticalPadding),
          children: [
            headText(context: context, text: "Current Password"),
            gap8,
            ValueListenableBuilder(
                valueListenable: _obsecureCurrPassword,
                builder: (context, value, _) {
                  return TextFieldWidget(
                    controller: _currPasswordController,
                    focusNode: _currPassFocus,
                    obsecure: value,
                    maxLines: 1,
                    hint: "Current Password",
                    preFixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecureCurrPassword.value =
                            !_obsecureCurrPassword.value;
                      },
                      child: Icon(
                        value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                    onFieldSubmitted: (valule) {
                      context.changeFocus(_currPassFocus, _newPassFocus);
                    },
                    validator: FormValidators.password.call,
                  );
                }),
            gap16,
            headText(context: context, text: "New Password"),
            gap8,
            ValueListenableBuilder(
                valueListenable: _obsecureNewPassword,
                builder: (context, value, _) {
                  return TextFieldWidget(
                    controller: _newPasswordController,
                    focusNode: _newPassFocus,
                    obsecure: value,
                    maxLines: 1,
                    hint: "New Password",
                    preFixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecureNewPassword.value =
                            !_obsecureNewPassword.value;
                      },
                      child: Icon(
                        value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                    onFieldSubmitted: (valule) {
                      context.changeFocus(_newPassFocus, _confirmPassFocus);
                    },
                    validator: FormValidators.password.call,
                  );
                }),
            gap16,
            headText(context: context, text: "Confirm Password"),
            gap8,
            ValueListenableBuilder(
                valueListenable: _obsecureConfirmPassword,
                builder: (context, value, _) {
                  return TextFieldWidget(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPassFocus,
                    obsecure: value,
                    maxLines: 1,
                    hint: "Confirm Password",
                    preFixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecureConfirmPassword.value =
                            !_obsecureConfirmPassword.value;
                      },
                      child: Icon(
                        value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                    onFieldSubmitted: (valule) {},
                    validator: FormValidators.password.call,
                  );
                }),
            gap28,
            Consumer(builder: (context, ref, _) {
              return ChangePasswordButton(onSubmit: () async {
                if (!_formKey.currentState!.validate()) return;
                if (isValidated(context: context)) {
                  await ref.read(changePasswordPod.notifier).changePassword(
                      currPass: _currPasswordController.text,
                      newPass: _newPasswordController.text);
                }
              });
            })
          ],
        ),
      ),
    );
  }

  bool isValidated({required BuildContext context}) {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      context.showFlash<bool>(
          barrierBlur: 1,
          barrierDismissible: true,
          builder: (context, controller) => FlashBarWidget(
              controller: controller,
              content:
                  "Oops! Your new password and confirm password don't match."));
      return false;
    }
    return true;
  }

  Text headText({required BuildContext context, required String text}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/signin_provider.dart';
import 'package:theraman/src/features/authentication/presentation/comp/signin_button.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/constants/app_assets.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/formfield_validator.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/focus_node_ext.dart';

@RoutePage(deferredLoading: true, name: "LoginRoute")
class LoginScreen extends StatelessWidget {
  final String userType;
  LoginScreen({super.key, required this.userType});

  final _obsecurePassword = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
      ),
      bottomNavigationBar: TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password\t?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          )),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const Image(
                  fit: BoxFit.contain,
                  height: 250,
                  image: AssetImage(AppAssets.logo)),
              gap8,
              Text(
                "Sign In With Your Number & Password\nor Continue With Mobile Number",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              gap32,
              TextFieldWidget(
                focusNode: emailNode,
                controller: mobileController,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                keyboardKey: TextInputType.number,
                preFixIcon: Icon(
                  Icons.phone,
                  color: Theme.of(context).primaryColor,
                ),
                onFieldSubmitted: (value) {
                  context.changeFocus(emailNode, passwordNode);
                },
                maxLines: 1,
                hint: "Mobile Number",
                validator: FormValidators.phone.call,
              ),
              gap16,
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, _) {
                    return TextFieldWidget(
                      controller: passwordController,
                      focusNode: passwordNode,
                      preFixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                      hint: "Password",
                      obsecure: _obsecurePassword.value,
                      maxLines: 1,
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(
                          _obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      validator:
                          FormValidators.requiredWithFieldName("Password").call,
                    );
                  }),
              gap24,
              Consumer(builder: (context, ref, _) {
                return SigninButton(onSubmit: () async {
                  if (!_formKey.currentState!.validate()) return;
                  await ref.read(signinProvider.notifier).signin(
                      mobileNo: mobileController.text.trim(),
                      password: passwordController.text.trim(),
                      userType: userType);
                });
              }),
              gap28,
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              gap28,
              CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).primaryColor,
                child: IconButton(
                    onPressed: () {
                      context.navigateTo(MobileNumberRoute(userType: userType));
                    },
                    icon: Icon(
                      Icons.phone,
                      color: AppColors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/common_ext/focus_node_ext.dart';

@RoutePage(deferredLoading: true, name: "LoginRoute")
class LoginScreen extends StatelessWidget {
  final String userType;
  LoginScreen({Key? key, required this.userType}) : super(key: key);

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
                  image: AssetImage("assets/images/harmoney_logo.png")),
              gapH8,
              Text(
                "Sign In With Your Email And Password  \n or Continue With Mobile Number",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              gapW32,
              TextFieldWidget(
                focusNode: emailNode,
                controller: emailController,
                preFixIcon: Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
                onFieldSubmitted: (value) {
                  context.changeFocus(emailNode, passwordNode);
                },
                maxLines: 1,
                hint: "Email",
                validator: (p0) {
                  if (p0 != null && p0.isNotEmpty) {
                    return null;
                  }
                  return "Email is required";
                },
              ),
              gapH16,
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
                      validator: (p0) {
                        if (p0 != null && p0.isNotEmpty) {
                          return null;
                        }
                        return "Password is required";
                      },
                    );
                  }),
              gapH24,
              ElevatedButtonWidget(
                onPressed: () {},
                text: "LOGIN",
              ),
              gapW28,
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              gapW28,
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

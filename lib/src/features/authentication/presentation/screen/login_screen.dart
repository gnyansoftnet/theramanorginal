import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/global/widgets/textfield_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "LoginRoute")
class LoginScreen extends StatelessWidget {
  final String userType;
  const LoginScreen({Key? key, required this.userType}) : super(key: key);

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
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SvgPicture.asset(
              "assets/images/svg/profile.svg",
              fit: BoxFit.contain,
              height: 180,
            ),
            gapH8,
            Text(
              "Sign In With Your Email And Password  \n or Continue With Mobile Number",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            gapW32,
            TextFieldWidget(
              preFixIcon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
              hint: "Email",
            ),
            gapH16,
            TextFieldWidget(
              preFixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              ),
              hint: "Password",
              suffixIcon: Icon(
                Icons.visibility_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
            gapH24,
            ElevatedButtonWidget(
                onPressed: () {},
                child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                )),
            gapW28,
            Text(
              "OR",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            gapW28,
            GestureDetector(
              onTap: () {
                context.navigateTo(MobileNumberRoute(userType: userType));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

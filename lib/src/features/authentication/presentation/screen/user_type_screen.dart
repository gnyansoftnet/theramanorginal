import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "UserTypeRoute")
class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/harmoney_logo.png")),
              gapH20,
              userTypeCard(
                  context: context,
                  title: "I am  Executive",
                  onPressed: () {
                    context.navigateTo(LoginRoute(userType: "E"));
                  },
                  userType: "E"),
              gapH16,
              userTypeCard(
                  context: context,
                  title: "I am  Therapist",
                  onPressed: () {
                    context.navigateTo(LoginRoute(userType: "T"));
                  },
                  userType: "T"),
              gapH16,
              userTypeCard(
                  context: context,
                  title: "I am  Patient",
                  onPressed: () {},
                  userType: "P")
            ],
          ),
        ),
      ),
    );
  }

  Widget userTypeCard({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
    required String userType,
  }) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55)),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
        ));
  }
}

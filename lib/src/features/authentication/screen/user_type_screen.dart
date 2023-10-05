import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/global/widgets/elevated_button_widget.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "UserTypeRoute")
class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Image(
                      fit: BoxFit.cover,
                      height: 200,
                      image: AssetImage("assets/images/harmoney_logo.png")),
                  gapH20,
                  userTypeCard(
                      title: "I am  Executive",
                      onPressed: () {},
                      userType: "E"),
                  gapH16,
                  userTypeCard(
                      title: "I am  Therapist",
                      onPressed: () {
                        context.navigateTo(LoginRoute(userType: "T"));
                      },
                      userType: "T"),
                  gapH16,
                  userTypeCard(
                      title: "I am  Patient", onPressed: () {}, userType: "P")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userTypeCard({
    required String title,
    required VoidCallback onPressed,
    required String userType,
  }) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: onPressed,
          child: AutoSizeText(title)),
    );
  }
}

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: ListView(
            shrinkWrap: true,
            children: [
              const CircleAvatar(
                  radius: 85,
                  backgroundImage:
                      AssetImage("assets/images/harmoney_logo.jpg")),
              gapH16,
              ElevatedButtonWidget(
                text: "I am Executive",
                onPressed: () {},
                borderRadus: 0.0,
              ),
              gapH16,
              ElevatedButtonWidget(
                  text: "I am Doctor",
                  borderRadus: 0.0,
                  onPressed: () {
                    context.navigateTo(LoginRoute());
                  }),
              gapH16,
              ElevatedButtonWidget(
                text: "I am Patient",
                onPressed: () {},
                borderRadus: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

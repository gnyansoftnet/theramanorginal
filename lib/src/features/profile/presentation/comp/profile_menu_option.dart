import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/profile/presentation/comp/profile_lis_tile.dart';
import 'package:theraman/src/utils/constants/constant.dart';

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDefaults.margin),
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.boxShadow,
        borderRadius: AppDefaults.borderRadius,
      ),
      child: Column(
        children: [
          ProfileListTile(
            title: 'My Profile',
            icon: Icons.account_circle,
            onTap: () {},
          ),
          const Divider(thickness: 0.5),
          ProfileListTile(
            title: 'Change Password',
            icon: Icons.security,
            onTap: () {
              context.navigateTo(ChangePasswordRoute());
            },
          ),
          const Divider(thickness: 0.5),
          Consumer(builder: (context, ref, _) {
            return ProfileListTile(
              title: 'Logout',
              icon: Icons.logout,
              onTap: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog.adaptive(
                        title: const Text("LOGOUT"),
                        content: const Text("Are you sure want to logout "),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No")),
                          TextButton(
                              onPressed: () async {
                                ref
                                    .read(userProvider.notifier)
                                    .clearUser()
                                    .then((value) {
                                  if (value && context.mounted) {
                                    context.router
                                        .replaceAll([const UserTypeRoute()]);
                                  }
                                });
                              },
                              child: const Text("Yes"))
                        ],
                      );
                    });
              },
            );
          }),
        ],
      ),
    );
  }
}

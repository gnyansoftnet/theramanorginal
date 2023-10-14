import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/features/user/presentation/controller/user_controller.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

@RoutePage(deferredLoading: true, name: "UserProfileRoute")
class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = UserController();
    final userState = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      drawer: const DrawerWidget(currentPage: "UserProfileRoute"),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(userProvider);
        },
        child: userState.easyWhen(onRetry: () {
          ref.invalidate(userProvider);
        }, data: (value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(50)),
                        width: 150.0,
                        height: 150.0,
                        child: ClipOval(
                          child: SvgPicture.asset(
                            'assets/images/svg/profile.svg',
                            fit: BoxFit.cover,
                          ),
                        )),
                    gapH8,
                    Text(
                      "${value.staffName}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                gapH16,
                Column(
                  children: [
                    userInfo(data: "${value.designation}", icon: Icons.title),
                    gapH12,
                    userInfo(
                      data: value.emailId.toString(),
                      icon: Icons.email,
                      onTap: () async {
                        userController.redirectLink(
                            value: value.emailId.toString(), action: 'mailto');
                      },
                    ),
                    gapH12,
                    userInfo(
                      data: "+91 ${value.mobNo}",
                      icon: Icons.call,
                      onTap: () async {
                        userController.redirectLink(
                            value: value.mobNo.toString(), action: 'tel');
                      },
                    ),
                    gapH12,
                    OutlinedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Logout"),
                                  content: const Text(
                                      "Are you sure want to logout "),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No")),
                                    TextButton(
                                        onPressed: () async {
                                          await Preferences.removeUser();
                                          if (context.mounted) {
                                            context.router.replaceAll(
                                                [const SplashRoute()]);
                                          }
                                        },
                                        child: const Text("Yes"))
                                  ],
                                );
                              });
                        },
                        child: const Text("Logout"))
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget userInfo(
      {required String data, required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.blue,
              ),
              gapW4,
              Text(
                data,
                style: TextStyle(
                    color: AppColors.blue, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}

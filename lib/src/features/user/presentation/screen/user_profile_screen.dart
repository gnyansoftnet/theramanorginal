import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/features/user/presentation/controller/user_controller.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
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
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure want to logout "),
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
                                  context.router
                                      .replaceAll([const SplashRoute()]);
                                }
                              },
                              child: const Text("Yes"))
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.blue,
              ))
        ],
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              elevation: 3.0,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 70,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${value.staffName}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          gapH4,
                          Text("${value.designation}"),
                          gapH4,
                          Row(
                            children: [
                              const Text(
                                "Email:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              gapW4,
                              InkWell(
                                onTap: () {
                                  userController.redirectLink(
                                      value: value.emailId.toString(),
                                      action: 'mailto');
                                },
                                child: Text("${value.emailId}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              ),
                            ],
                          ),
                          gapH4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                " Mobile:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              gapW4,
                              GestureDetector(
                                onTap: () async {
                                  userController.redirectLink(
                                      value: value.mobNo.toString(),
                                      action: 'tel');
                                },
                                child: Text(
                                  "+91${value.mobNo}",
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          );
        }),
      ),
    );
  }
}

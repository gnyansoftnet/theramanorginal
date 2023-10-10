import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const AutoSizeText("Logout"),
                        content:
                            const AutoSizeText("Are you sure want to logout "),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const AutoSizeText("No")),
                          TextButton(
                              onPressed: () async {
                                await Preferences.removeUser();
                                if (context.mounted) {
                                  context.router
                                      .replaceAll([const SplashRoute()]);
                                }
                              },
                              child: const AutoSizeText("Yes"))
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
        child: userState.easyWhen(data: (value) {
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
                          AutoSizeText(
                            "${value.staffName}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          gapH4,
                          AutoSizeText("${value.designation}"),
                          gapH4,
                          Row(
                            children: [
                              const AutoSizeText(
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
                                child: AutoSizeText("${value.emailId}",
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
                              const AutoSizeText(
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
                                child: AutoSizeText(
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

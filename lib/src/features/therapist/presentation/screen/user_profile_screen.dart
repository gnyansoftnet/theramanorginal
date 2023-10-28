import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
import 'package:theraman/src/features/therapist/presentation/controller/user_controller.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';
import 'package:theraman/src/utils/common_methods.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

@RoutePage(deferredLoading: true, name: "UserProfileRoute")
class UserProfileScreen extends ConsumerWidget {
  UserProfileScreen({super.key});
  final userController = UserController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                context.router.replaceAll([DashboardRoute()]);
              },
              icon: const Icon(Icons.home))
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
                    // gapH12,
                    // OutlinedButton(
                    //     onPressed: () {
                    //       userLogout(context: context);
                    //     },
                    //     child: const Text("Logout"))
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

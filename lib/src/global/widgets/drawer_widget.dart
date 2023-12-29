import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
import 'package:theraman/src/global/pod/check_user_type_pod.dart';
import 'package:theraman/src/global/helper/common_methods.dart';
import 'package:theraman/src/utils/constants/app_assets.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/asyncvalue_easy_when.dart';

class DrawerWidget extends ConsumerWidget {
  final String currentPage;
  const DrawerWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final userTypeState = ref.watch(checkUserTypePod);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: userTypeState.value == "T"
            ? [
                DrawerHeader(
                    padding: const EdgeInsets.all(0),
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              AppAssets.user,
                              fit: BoxFit.cover,
                            )),
                        gapH4,
                        userState.easyWhen(
                          data: (value) => Text(
                            "${value.staffName}",
                            style: TextStyle(color: AppColors.white),
                          ),
                          errorWidget: (_, __) => Text(
                            "Loading ...",
                            style: TextStyle(color: AppColors.white),
                          ),
                          loadingWidget: () => Text(
                            "Loading ...",
                            style: TextStyle(color: AppColors.white),
                          ),
                        )
                      ],
                    )),
                DrawerTile(
                    icon: Icons.dashboard,
                    onTap: () {
                      if (currentPage != "DashboardRoute") {
                        context.navigateTo(DashboardRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Dashboard",
                    isSelected: currentPage == "DashboardRoute" ? true : false),
                DrawerTile(
                    icon: Icons.person,
                    onTap: () {
                      if (currentPage != "UserProfileRoute") {
                        context.navigateTo(UserProfileRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Profile",
                    isSelected:
                        currentPage == "UserProfileRoute" ? true : false),
                DrawerTile(
                    icon: Icons.calendar_month,
                    onTap: () {
                      if (currentPage != "TomorrowSessionRoute") {
                        context.navigateTo(TomorrowSessionRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Tomorrow Session",
                    isSelected:
                        currentPage == "TomorrowSessionRoute" ? true : false),
                DrawerTile(
                    icon: Icons.holiday_village,
                    onTap: () {
                      if (currentPage != "ApplyLeaveRoute") {
                        context.navigateTo(ApplyLeaveRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Apply Leave",
                    isSelected:
                        currentPage == "ApplyLeaveRoute" ? true : false),
                DrawerTile(
                    icon: Icons.check_circle,
                    onTap: () {
                      if (currentPage != "LeaveStatusRoute") {
                        context.navigateTo(LeaveStatusRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Leave Status",
                    isSelected:
                        currentPage == "LeaveStatusRoute" ? true : false),
                DrawerTile(
                    icon: Icons.report,
                    onTap: () {
                      if (currentPage != "SessionReportRoute") {
                        context.navigateTo(SessionReportRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Session Report",
                    isSelected:
                        currentPage == "SessionReportRoute" ? true : false),
                DrawerTile(
                    icon: Icons.settings,
                    onTap: () {
                      if (currentPage != "SettingRoute") {
                        context.navigateTo(const SettingRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Setting",
                    isSelected: currentPage == "SettingRoute" ? true : false),
                DrawerTile(
                    icon: Icons.logout,
                    onTap: () {
                      userLogout(context: context);
                    },
                    title: "Logout",
                    isSelected: false),
              ]
            : [
                DrawerHeader(
                    padding: const EdgeInsets.all(0),
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              AppAssets.user,
                              fit: BoxFit.cover,
                            )),
                        gapH4,
                        userState.easyWhen(
                          data: (value) => Text(
                            "${value.staffName}",
                            style: TextStyle(color: AppColors.white),
                          ),
                          errorWidget: (_, __) => Text(
                            "Loading ...",
                            style: TextStyle(color: AppColors.white),
                          ),
                          loadingWidget: () => Text(
                            "Loading ...",
                            style: TextStyle(color: AppColors.white),
                          ),
                        )
                      ],
                    )),
                DrawerTile(
                    icon: Icons.dashboard,
                    onTap: () {
                      if (currentPage != "DashboardRoute") {
                        context.navigateTo(DashboardRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Dashboard",
                    isSelected: currentPage == "DashboardRoute" ? true : false),
                DrawerTile(
                    icon: Icons.person,
                    onTap: () {
                      if (currentPage != "UserProfileRoute") {
                        context.navigateTo(UserProfileRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Profile",
                    isSelected:
                        currentPage == "UserProfileRoute" ? true : false),
                DrawerTile(
                    icon: Icons.holiday_village,
                    onTap: () {
                      if (currentPage != "ExeApplyLeaveRoute") {
                        context.navigateTo(ExeApplyLeaveRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Apply Leave",
                    isSelected:
                        currentPage == "ExeApplyLeaveRoute" ? true : false),
                DrawerTile(
                    icon: Icons.calendar_month,
                    onTap: () {
                      if (currentPage != "ExeTomorrowSessionRoute") {
                        context.navigateTo(ExeTomorrowSessionRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "Tomorrow Session",
                    isSelected: currentPage == "ExeTomorrowSessionRoute"
                        ? true
                        : false),
                DrawerTile(
                    icon: Icons.check_circle,
                    onTap: () {
                      if (currentPage != "ExeLeaveStatusRoute") {
                        context.navigateTo(ExeLeaveStatusRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "leave Status",
                    isSelected:
                        currentPage == "ExeLeaveStatusRoute" ? true : false),
                DrawerTile(
                    icon: Icons.settings,
                    onTap: () {
                      if (currentPage != "SettingRoute") {
                        context.navigateTo(const SettingRoute());
                        Navigator.pop(context);
                      }
                    },
                    title: "setting",
                    isSelected: currentPage == "SettingRoute" ? true : false),
                DrawerTile(
                  icon: Icons.logout,
                  onTap: () {
                    userLogout(context: context);
                  },
                  title: "Logout",
                  isSelected: false,
                ),
              ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;
  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.only(left: 5, right: 10),
            decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: ListTile(
              visualDensity: const VisualDensity(
                vertical: -2,
              ),
              leading: Icon(
                icon,
                color: isSelected ? AppColors.white : AppColors.black,
              ),
              title: Text(
                title,
                style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.black),
              ),
            )));
  }
}

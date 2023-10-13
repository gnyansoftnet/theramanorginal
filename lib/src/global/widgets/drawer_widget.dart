import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

class DrawerWidget extends StatelessWidget {
  final String currentPage;
  const DrawerWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      width: MediaQuery.sizeOf(context).width / 1.2,
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset("assets/images/svg/profile.svg",
                    fit: BoxFit.cover),
              ),
              gapH12,
              Consumer(builder: (context, ref, _) {
                final userState = ref.watch(userProvider);
                final userName = userState.whenData((value) => value.staffName);
                return Text(
                    userName.value == null ? "Dr. Demo" : "${userName.value}");
              })
            ],
          )),
          DrawerTile(
              icon: Icons.dashboard,
              onTap: () {
                if (currentPage != "DashboardRoute") {
                  context.navigateTo(const DashboardRoute());
                  Navigator.pop(context);
                }
              },
              title: "Dashboard",
              isSelected: currentPage == "DashboardRoute" ? true : false),
          DrawerTile(
              icon: Icons.person,
              onTap: () {
                if (currentPage != "UserProfileRoute") {
                  context.navigateTo(const UserProfileRoute());
                  Navigator.pop(context);
                }
              },
              title: "Profile",
              isSelected: currentPage == "UserProfileRoute" ? true : false),
          DrawerTile(
              icon: Icons.calendar_month,
              onTap: () {
                if (currentPage != "TomorrowSessionRoute") {
                  context.navigateTo(const TomorrowSessionRoute());
                  Navigator.pop(context);
                }
              },
              title: "Tomorrow Session",
              isSelected: currentPage == "TomorrowSessionRoute" ? true : false),
          DrawerTile(
              icon: Icons.holiday_village,
              onTap: () {
                if (currentPage != "ApplyLeaveRoute") {
                  context.navigateTo(ApplyLeaveRoute());
                  Navigator.pop(context);
                }
              },
              title: "Apply Leave",
              isSelected: currentPage == "ApplyLeaveRoute" ? true : false),
          DrawerTile(
              icon: Icons.check_circle,
              onTap: () {
                if (currentPage != "LeaveStatusRoute") {
                  context.navigateTo(const LeaveStatusRoute());
                  Navigator.pop(context);
                }
              },
              title: "Leave Status",
              isSelected: currentPage == "LeaveStatusRoute" ? true : false),
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
                    ? Theme.of(context).focusColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: ListTile(
              visualDensity: const VisualDensity(
                vertical: -2,
              ),
              leading: Icon(icon),
              title: AutoSizeText(title),
            )));
  }
}

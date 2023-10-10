import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:theraman/src/utils/constants/gaps.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/asyncvalue_easy_when.dart';

class DrawerWidget extends StatelessWidget {
  final String currentPage;
  const DrawerWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      width: 300,
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              gapH12,
              Consumer(builder: (context, ref, _) {
                final userState = ref.watch(userProvider);
                final userName = userState.whenData((value) => value.staffName);
                return AutoSizeText(
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
                  context.navigateTo(const ApplyLeaveRoute());
                  Navigator.pop(context);
                }
              },
              title: "Apply Leave",
              isSelected: currentPage == "ApplyLeaveRoute" ? true : false),
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
            decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).focusColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: ListTile(
              leading: Icon(icon),
              title: AutoSizeText(title),
            )));
  }
}


//  Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 24.0),
//                   child: Icon(icon,
//                       size: 20, color: isSelected ? Colors.white : iconColor),
//                 ),
//                 SizedBox(
//                   width: 200,
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: isSelected ? Colors.white : Colors.black),
//                   ),
//                 ),
//               ],
//             )

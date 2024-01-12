import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/features/profile/presentation/comp/profile_header.dart';
import 'package:theraman/src/features/profile/presentation/comp/profile_menu_option.dart';
import 'package:theraman/src/global/widgets/drawer_widget.dart';

@RoutePage(deferredLoading: true, name: "ProfileRoute")
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.popRoute();
          },
        ),
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      drawer: const DrawerWidget(currentPage: "ProfileRoute"),
      body: ListView(
        children: const [
          ProfileHeader(),
          ProfileMenuOptions(),
        ],
      ),
    );
  }
}

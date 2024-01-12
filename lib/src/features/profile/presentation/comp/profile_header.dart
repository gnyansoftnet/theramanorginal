import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/utils/constants/constant.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Card(
          elevation: 5.0,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(50, 20),
                  bottomRight: Radius.elliptical(50, 20))),
          child: Container(
            height: size.height / 3,
          ),
        ),
        const _UserData(),
      ],
    );
  }
}

class _UserData extends ConsumerWidget {
  const _UserData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        SizedBox(
          width: size.width / 3,
          height: size.height / 3,
          child: ClipOval(
            child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  AppAssets.user,
                  fit: BoxFit.contain,
                )),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.Staff_Name ?? "",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).cardColor),
            ),
            gap8,
            userInfo(
                context: context,
                text: user?.Staff_Code ?? "",
                icon: Icons.code),
            gap8,
            userInfo(
                context: context,
                text: "+91${user?.Mob_No ?? ""}",
                icon: Icons.phone),
            gap8,
            userInfo(
                context: context,
                text: user?.Email_Id ?? "",
                icon: Icons.email),
          ],
        )
      ],
    );
  }

  Row userInfo(
      {required BuildContext context,
      required String text,
      required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).cardColor,
        ),
        gap8,
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).cardColor),
        ),
      ],
    );
  }
}

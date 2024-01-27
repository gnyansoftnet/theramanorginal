import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theraman/src/utils/constants/constant.dart';
import 'package:theraman/src/utils/extensions/ext.dart';

class SnackContentWidget extends StatelessWidget {
  final String content;
  const SnackContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color(0xFFC72C41),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              gap48,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Warning !",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold),
                    ),
                    gap4,
                    Text(
                      content,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).cardColor),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                AppAssets.bubblesImg,
                height: 50,
                width: 50,
                // ignore: deprecated_member_use
                color: const Color(0xFF801336),
              ),
            )),
        Positioned(
            top: -14,
            left: 0,
            child: InkWell(
              onTap: () {
                context.clearSnackBar();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.failImg,
                    height: 40,
                  ),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset(
                      AppAssets.closeImg,
                      height: 16,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

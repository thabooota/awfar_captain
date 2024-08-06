import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class CustomAccountViewRow extends StatelessWidget {
  const CustomAccountViewRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: ColorManager.originalWhite,
          radius: 37.0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://scontent.fcai19-6.fna.fbcdn.net/v/t39.30808-1/451371717_3869431286606994_5963826142988558334_n.jpg?stp=dst-jpg_p160x160&_nc_cat=102&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeEOWSKKtDlYfBzd79VnEiL__SRoExsbuOz9JGgTGxu47EAxjjgmrt_YijOCAzDgS85llnRuCg0dAIONAVq0vI0r&_nc_ohc=cHUPiv7aFRIQ7kNvgGwo6-9&_nc_ht=scontent.fcai19-6.fna&oh=00_AYB1saN1E6AfWKtxV9PIKR5HPEBa8N-5WB-PYgqn2vCHQg&oe=66A48334"),
            radius: 35.5,
          ),
        ),
        horizontalSpace(22.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Youssef Thabet",
              style: TextStyleManager.font20TextColor600,
            ),
            verticalSpace(8.0),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: ColorManager.originalWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: ColorManager.yellow,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "4.6",
                    style: TextStyleManager.font13Black700,
                  ),
                  horizontalSpace(4.0),
                  SvgPicture.asset(AssetsManager.icFavorites),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

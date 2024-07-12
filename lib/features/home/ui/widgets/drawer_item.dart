import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/text_style_manager.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title.tr(),
          style: TextStyleManager.font17Black600,
        ),
        leading: SvgPicture.asset(
          icon,
          colorFilter:
              const ColorFilter.mode(Color(0xFFBEC2CE), BlendMode.srcIn),
        ),
      ),
    );
  }
}

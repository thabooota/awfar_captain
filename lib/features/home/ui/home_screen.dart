import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/features/home/ui/widgets/drawer_view.dart';
import 'package:awfar_captain/features/home/ui/widgets/home_map_view.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isOnline ? LocaleKeys.homeAppBarTitle1.tr() : LocaleKeys.homeAppBarTitle2.tr() , style: TextStyleManager.font17TextColor600,),
            horizontalSpace(5.w),
            Switch(
              trackOutlineColor: WidgetStateProperty.resolveWith(
                    (final Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return ColorManager.green;

                  }

                  return ColorManager.darkGrey;
                },
              ),
              inactiveThumbColor: ColorManager.darkGrey,
              activeColor: ColorManager.green,
              activeTrackColor: ColorManager.originalWhite,
              inactiveTrackColor: ColorManager.originalWhite,
              value: isOnline,onChanged: (value) => setState(() {
              isOnline = value;
            }),),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetsManager.icNotification),
            onPressed: () => context.pushNamed(Routes.notification),
          ),
        ],
      ),
      drawer: const DrawerView(),
      body:const HomeMapView(),
    );
  }
}

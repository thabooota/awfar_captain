import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/assets_manager.dart';
import 'package:awfar_captain/features/home/ui/widgets/account_settings_item.dart';
import 'package:awfar_captain/features/home/ui/widgets/custom_account_view_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../lang/locale_keys.g.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              color: ColorManager.green,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      LocaleKeys.accountSettings.tr(),
                      style: TextStyleManager.font17White500,
                    ),
                    leading: SvgPicture.asset(AssetsManager.icSettings, colorFilter: const ColorFilter.mode(ColorManager.originalWhite, BlendMode.srcIn),),
                  ),
                  verticalSpace(20.h),
                  const CustomAccountViewRow(),
                  verticalSpace(15.h),
                  Divider(
                    color: ColorManager.lighterGrey,
                    endIndent: 10.h,
                    indent: 10.h,
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            AccountSettingsItem(onPressed: () {}, text: LocaleKeys.editAccount.tr(),),
            AccountSettingsItem(onPressed: () {}, text: LocaleKeys.changePassword.tr(),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(LocaleKeys.notifications.tr(), style: TextStyleManager.font17TextColor400),
                  const Spacer(),
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
                      value: true,
                      onChanged: (value) => {}),
                ],
              ),
            ),
            AccountSettingsItem(onPressed: () {}, text: LocaleKeys.myRides.tr(),),
            verticalSpace(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                LocaleKeys.more.tr(),
                style: TextStyleManager.font17Black700,
              ),
            ),
            verticalSpace(10.h),
            AccountSettingsItem(onPressed: () {}, text: LocaleKeys.aboutApp.tr(),),
            AccountSettingsItem(onPressed: () {}, text: LocaleKeys.privacyPolicy.tr(),),
          ],
        ),
      ),
    );
  }
}

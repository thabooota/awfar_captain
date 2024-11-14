import 'package:awfar_captain/core/app_cubit/app_cubit.dart';
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/assets_manager.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/ui/widgets/account_settings_item.dart';
import 'package:awfar_captain/features/home/ui/widgets/custom_account_view_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../lang/locale_keys.g.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  bool notification = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
              ),
              color: ColorManager.green,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      LocaleKeys.accountSettings.tr(),
                      style: TextStyleManager.font17White500,
                    ),
                    leading: SvgPicture.asset(
                      AssetsManager.icSettings,
                      colorFilter: const ColorFilter.mode(
                          ColorManager.originalWhite, BlendMode.srcIn),
                    ),
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
            AccountSettingsItem(
              onPressed: () => context.pushNamed(
                Routes.editAccount,
              ),
              text: LocaleKeys.editAccount.tr(),
            ),
            AccountSettingsItem(
              onPressed: () => context.pushNamed(Routes.changePassword),
              text: LocaleKeys.changePassword.tr(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(LocaleKeys.notifications.tr(),
                      style: TextStyleManager.font17TextColor400),
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
                      value: notification,
                      onChanged: (value) => {
                        setState(
                          () {
                            notification = value;
                          }
                        )
                      }),
                ],
              ),
            ),
            AccountSettingsItem(
              onPressed: () => context.pushNamed(Routes.myRides),
              text: LocaleKeys.myRides.tr(),
            ),
            verticalSpace(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                LocaleKeys.more.tr(),
                style: TextStyleManager.font17Black700,
              ),
            ),
            verticalSpace(10.h),
            AccountSettingsItem(
              onPressed: () {},
              text: LocaleKeys.aboutApp.tr(),
            ),
            AccountSettingsItem(
              onPressed: () {},
              text: LocaleKeys.privacyPolicy.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

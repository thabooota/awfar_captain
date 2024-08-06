import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/features/home/ui/widgets/custom_account_view_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/local/prefs_manager.dart';
import '../../../../core/networking/local/shared_preferences.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import 'drawer_item.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: ColorManager.originalWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  right: 18.0,
                  left: 18.0,
                  top: 22.0,
                  bottom: 55.0,
                ),
                color: ColorManager.lightGrey,
                child: const CustomAccountViewRow()
              ),
              DrawerItem(
                title: LocaleKeys.drawerItemHome.tr(),
                icon: AssetsManager.icHome,
                onTap: () {
                  context.pushReplacementNamed(Routes.home);
                },
              ),
              DrawerItem(
                title: LocaleKeys.drawerItemFiles.tr(),
                icon: AssetsManager.icFavorites,
                onTap: () {},
              ),
              DrawerItem(
                title: LocaleKeys.captainGate.tr(),
                icon: AssetsManager.icHome,
                onTap: () => context.pushNamed(Routes.captainGate),
              ),
              DrawerItem(
                title: LocaleKeys.drawerItemLang.tr(),
                icon: AssetsManager.icLang,
                onTap: () {
                  if (SharedPreferencesManager.getData(key: PrefsManager.lang) ==
                      "en") {
                    SharedPreferencesManager.saveData(
                            key: PrefsManager.lang, value: "ar")
                        .then((_) async {
                      await context.setLocale(const Locale('ar'));
                    });
                  } else {
                    SharedPreferencesManager.saveData(
                            key: PrefsManager.lang, value: "en")
                        .then((_) async {
                      await context.setLocale(const Locale('en'));
                    });
                  }
                },
              ),
              DrawerItem(
                title: LocaleKeys.drawerItemNotifications.tr(),
                icon: AssetsManager.icNotification,
                onTap: () => context.pushNamed(Routes.notification),
              ),
              DrawerItem(
                title: LocaleKeys.drawerItemSupport.tr(),
                icon: AssetsManager.icSupport,
                onTap: () {
                  context.pushNamed(Routes.technicalSupport);
                },
              ),
              DrawerItem(
                title: LocaleKeys.accountSettings.tr(),
                icon: AssetsManager.icSettings,
                onTap: () {
                  context.pushNamed(Routes.accountSettings);
                },
              ),
              DrawerItem(
                title: LocaleKeys.drawerItemLogout.tr(),
                icon: AssetsManager.icLogout,
                onTap: () {
                  SharedPreferencesManager.removeData(key: PrefsManager.token)
                      .then((_) => context.pushNamedAndRemoveUntil(Routes.login,
                          predicate: (Route<dynamic> route) => false));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

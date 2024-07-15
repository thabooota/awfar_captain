import 'package:awfar_captain/core/helpers/extensions.dart';
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
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: ColorManager.originalWhite,
                    radius: 37.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://instagram.fcai19-6.fna.fbcdn.net/v/t51.2885-19/449756795_487664537094955_3462676777514892134_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fcai19-6.fna.fbcdn.net&_nc_cat=107&_nc_ohc=yCkX3IeOXLkQ7kNvgH8gnaS&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYDsABWg8DS4g77mzfM9XZRObhw9OeDigy8RDdlIVu_UOQ&oe=6695FAA0&_nc_sid=8f1549"),
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
              ),
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
                context.pushNamed(Routes.finishTrip);
              },
            ),
            DrawerItem(
              title: LocaleKeys.drawerItemSettings.tr(),
              icon: AssetsManager.icSettings,
              onTap: () {
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
    );
  }
}

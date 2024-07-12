import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/networking/local/prefs_manager.dart';
import '../../../core/networking/local/shared_preferences.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../lang/locale_keys.g.dart';

class ChangePasswordDoneScreen extends StatefulWidget {
  const ChangePasswordDoneScreen({super.key});

  @override
  State<ChangePasswordDoneScreen> createState() =>
      _ChangePasswordDoneScreenState();
}

class _ChangePasswordDoneScreenState extends State<ChangePasswordDoneScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      SharedPreferencesManager.saveData(
        key: PrefsManager.token,
        value: "test token",
      ).then(
        (_) => context.pushNamedAndRemoveUntil(
          Routes.home,
          predicate: (_) => false,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        backgroundColor: ColorManager.scaffold,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        shape: const Border(
            bottom: BorderSide(color: ColorManager.transparent, width: 0.0)),
      ),
      body: Center(
        child: Column(
          children: [
            verticalSpace(30.0.h),
            SvgPicture.asset(
              AssetsManager.imgChangePasswordDone,
              width: 250.0.w,
              height: 250.0.h,
            ),
            verticalSpace(60.0.h),
            Text(
              LocaleKeys.changePasswordDone.tr(),
              style: TextStyleManager.font20BlackBold,
            ),
          ],
        ),
      ),
    );
  }
}

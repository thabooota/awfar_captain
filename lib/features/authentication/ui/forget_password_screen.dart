import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_card_auth.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/forget_password_form.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/back_icon_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
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
        leading: const BackIconButton(),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40.h, left: 10.h, right:10.h),
        children: [
          CustomCardAuth(
              widget:  const ForgetPasswordForm(),
              text:  LocaleKeys.enterPhoneNumber.tr(), ),
        ],
      ),
    );
  }
}
String generateCountryFlag() {
  String countryCode = 'eg';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  return flag;
}

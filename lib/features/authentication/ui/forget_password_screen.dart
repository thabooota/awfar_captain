import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_card_auth.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/back_icon_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        leading: const BackIconButton(),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 60.h, left: 10.h, right:10.h),
        children: [
          CustomCardAuth(
              widget: Column(
                children: [
                  verticalSpace(30.h),
                  CustomTextForm(
                      validator: (value) {},
                      obscureText: false,
                      text: LocaleKeys.phoneHintText.tr(),
                      inputType: TextInputType.phone,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("${generateCountryFlag()} +02", style: TextStyleManager.font17blackBold,),
                      ),
                  ),
                  verticalSpace(30.h),
                  AppTextButton(
                      appText: LocaleKeys.btnNext.tr(),
                      onTap: () {
                        context.pushNamed(Routes.otpVerifyAccountForgetPassword);
                      }),
                ],
              ),
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

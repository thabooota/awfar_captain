import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_card_auth.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/app_text_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      body: SafeArea(
        child: ListView(
          padding:  EdgeInsets.only(top: 100.h, right: 10.0, left: 10.0),
          children: <Widget>[
            CustomCardAuth(
                widget: Column(
                  children: [
                    CustomTextForm(

                      validator: (value) {
                        return null ;
                      },
                      obscureText: false,
                      text: LocaleKeys.phoneHintText.tr(),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("${generateCountryFlag()} +02", style: TextStyleManager.font17blackBold,),
                      ),
                      inputType: TextInputType.phone,
                    ),
                    verticalSpace(30.h),
                    AppTextButton (
                      appText: LocaleKeys.btnNext.tr(),
                      onTap: () => context.pushNamed(Routes.otpVerifyAccountRegister),
                    ),
                  ],
                ),
                text: LocaleKeys.registerHeader.tr(),),
            verticalSpace(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.haveAccount.tr(), style: TextStyleManager.font17black400,),
                TextButton(
                    style:  const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(0.0))
                    ),
                    onPressed: () => context.pushReplacementNamed(Routes.login),
                    child: Text(LocaleKeys.loginNow.tr(), style: TextStyleManager.font17blackBold,))
              ],
            ),
          ],
        ),
      ),
    );
  }
  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}

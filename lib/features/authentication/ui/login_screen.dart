import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_card_auth.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/login_form.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      body: SafeArea(
       child: ListView(
         physics: const BouncingScrollPhysics(),
         padding:  EdgeInsets.only(top: 100.h, right: 10.0, left: 10.0),
         children: <Widget>[
           CustomCardAuth(
               widget: Column (
                   children: [
                     const LoginForm (),
                     AppTextButton (
                         appText: LocaleKeys.btnSend.tr(),
                         onTap: () {
                           context.pushReplacementNamed(Routes.captainGate);
                         },
                     ),
                   ],
               ),
               text: LocaleKeys.loginHeader.tr(),
           ),
         verticalSpace(20.h),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(LocaleKeys.forgetPassword.tr(), style: TextStyleManager.font17black400,),
               TextButton(
                   onPressed: () {
                     context.pushNamed(Routes.forgetPassword);
                   },
                   style: const ButtonStyle(
                       padding: WidgetStatePropertyAll(EdgeInsets.all(0.0))
                   ),
                   child: Text(LocaleKeys.clickHere.tr(), style: TextStyleManager.font17blackBold,))
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(LocaleKeys.noAccount.tr(), style: TextStyleManager.font17black400,),
               TextButton(
                 style:  const ButtonStyle(
                   padding: WidgetStatePropertyAll(EdgeInsets.all(0.0))
                 ),
                   onPressed: () => context.pushReplacementNamed(Routes.register),
                   child: Text(LocaleKeys.subscription.tr(), style: TextStyleManager.font17blackBold,))
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

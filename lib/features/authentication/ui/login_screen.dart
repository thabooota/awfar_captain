import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_card_auth.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: SvgPicture.asset(
        //   'assets/icons/ic_awfar_logo.svg',
        //   height: 400,
        // ),
       child: ListView(
         padding: const EdgeInsets.only(top: 40.0, right: 10.0, left: 10.0),
         children: <Widget>[
           CustomCardAuth(
               widget: Column (
                   children: [
                     const LoginForm (),
                     AppTextButton (
                         appText: 'التالي',
                         onTap: () {},
                     ),
                   ],
               ),
               text: 'تسجيل الدخول',
           ),
           const SizedBox(
             height: 50,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('نسيت كلمة المرور ؟ ', style: TextStyleManager.font17black400,),
               TextButton(
                   onPressed: () {},
                   style: const ButtonStyle(
                       padding: WidgetStatePropertyAll(EdgeInsets.all(0.0))
                   ),
                   child: Text('اضغط هنا', style: TextStyleManager.font17blackBold,))
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('ليس لديك حساب ؟ ', style: TextStyleManager.font17black400,),
               TextButton(
                 style:  const ButtonStyle(
                   padding: WidgetStatePropertyAll(EdgeInsets.all(0.0))
                 ),
                   onPressed: () => context.pushReplacementNamed(Routes.register),
                   child: Text('اشترك الآن', style: TextStyleManager.font17blackBold,))
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

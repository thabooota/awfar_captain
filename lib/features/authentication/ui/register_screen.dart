import 'package:awfar_captain/features/authentication/ui/widgets/custom_card_auth.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_text_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            CustomCardAuth(
                widget: Column(
                  children: [
                    CustomTextForm(
                      validator: (value) {
                        return null ;
                      },
                      obscureText: false,
                      text: 'رقم الموبايل',
                      suffixIcon: Text(generateCountryFlag()),
                    ),
                    const SizedBox(height: 30.0,),
                    AppTextButton (
                      appText: 'التالي',
                      onTap: () {},
                    ),
                  ],
                ),
                text: 'سجل برقم تليفونك')
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

import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'custom_text_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
            children: [
              CustomTextForm(
                validator: (value) {
                  return null ;
                },
                obscureText: false,
                text: 'رقم الموبايل',
                suffixIcon: Text(generateCountryFlag(), style: TextStyleManager.font17TextColor600,),
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextForm(
                validator: (value) {
                  return null ;
                },
                obscureText: false,
                text: 'الرقم السري',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: ColorManager.lighterGrey,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ]
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

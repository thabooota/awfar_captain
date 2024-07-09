import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';

import 'custom_text_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
            children: [
              CustomTextForm(
                inputType: TextInputType.phone,
                validator: (value) {
                  return null ;
                },
                obscureText: false,
                text: LocaleKeys.phoneHintText.tr(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("${generateCountryFlag()} +02", style: TextStyleManager.font17TextColor600,textAlign: TextAlign.center,),
                ),
              ),
              verticalSpace(15.h),
              CustomTextForm(
                validator: (value) {
                  return null ;
                },
                obscureText: false,
                text: LocaleKeys.passwordHintText.tr(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: ColorManager.lighterGrey,
                  ),
                ), inputType: TextInputType.visiblePassword,
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

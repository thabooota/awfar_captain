import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class ForgetPasswordFormView extends StatelessWidget {
  const ForgetPasswordFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 70.0.h),
          child: Text(
            LocaleKeys.forgetPassword.tr(),
            textAlign: TextAlign.center,
            style: TextStyleManager.font30Black600,
          ),
        ),
      ],
    );
  }
}

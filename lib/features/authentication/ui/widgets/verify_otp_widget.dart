import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class VerifyOTPWidget extends StatefulWidget {
  final String route;
  const VerifyOTPWidget({super.key, required this.route});

  @override
  State<VerifyOTPWidget> createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends State<VerifyOTPWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              verticalSpace(50.0),
              Text(
                LocaleKeys.enterOTPCode.tr(),
                style: TextStyleManager.font34TextColor600,
              ),
              verticalSpace(22.0),
              Text(
                LocaleKeys.OTPMessage.tr(),
                style: TextStyleManager.font17TextColor400,
              ),
              verticalSpace(65.0),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  controller: controller,
                  appContext: context,
                  validator: (value) {
                    return null;
                  },
                  animationCurve: Curves.easeInOut,
                  cursorColor: ColorManager.green,
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  textStyle: TextStyleManager.font32TextColor600,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(3),
                    fieldHeight: 53.h,
                    fieldWidth: 57.w,
                    borderWidth: 1.2,
                    activeFillColor: ColorManager.green,
                    inactiveFillColor: ColorManager.lightGrey,
                    activeColor: ColorManager.green,
                    inactiveColor: ColorManager.lightGrey,
                    selectedFillColor: ColorManager.lightGrey,
                    selectedColor: ColorManager.green,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                ),
              ),
              verticalSpace(65.0),
              AppTextButton(
                appText: LocaleKeys.btnNext.tr(),
                onTap: () => context.pushNamed(widget.route),
              ),
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  const CustomPinCodeTextField({
    super.key,
    required this.formKey,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: formKey,
        child: PinCodeTextField(
          controller: controller,
          appContext: context,
          validator: (value) => otpValidation(value),
          animationCurve: Curves.easeInOut,
          cursorColor: ColorManager.green,
          keyboardType: TextInputType.number,
          length: 4,
          obscureText: false,
          animationType: AnimationType.scale,
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(3),
            fieldHeight: 53.h,
            fieldWidth: 57.w,
            borderWidth: 1.2,
            activeFillColor: ColorManager.green,
            inactiveFillColor: ColorManager.lighterGrey,
            activeColor: ColorManager.green,
            inactiveColor: ColorManager.lighterGrey,
            selectedFillColor: ColorManager.lighterGrey,
            selectedColor: ColorManager.green,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
        ),
      ),
    );
  }

  String? otpValidation(otp) {
    if (otp == null || otp.isEmpty || otp.length != 4) {
      return "Please Enter a valid otp";
    } else {
      return null;
    }
  }
}

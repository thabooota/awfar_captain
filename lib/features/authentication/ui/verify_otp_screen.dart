import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/app_text_button.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        backgroundColor: ColorManager.scaffold,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        shape: const Border(
            bottom: BorderSide(color: ColorManager.transparent, width: 0.0)),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Transform.rotate(
            angle: 3.14,
            child: SvgPicture.asset(AssetsManager.icArrowLeft),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              verticalSpace(50.0),
              Text(
                "ادخل كود التحقق",
                style: TextStyleManager.font34TextColor600,
              ),
              verticalSpace(22.0),
              Text(
                "تم ارسال كود تحقق الى رقم تلفونك ",
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
                appText: "التالي",
                onTap: () => context.pushNamed(Routes.completeRegister),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

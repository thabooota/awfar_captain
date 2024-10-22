import 'package:awfar_captain/features/authentication/ui/widgets/verify_code_bloc_listener.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/verify_otp_widget.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/back_icon_button.dart';
import '../logic/forget_password/forget_password_cubit.dart';
import 'widgets/resend_code.dart';

class VerifyOtpForgetPassword extends StatelessWidget {
  final String phone;
  const VerifyOtpForgetPassword({super.key, required this.phone});

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
        leading: const BackIconButton(),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            LocaleKeys.enterOTPCode.tr(),
            style: TextStyleManager.font34TextColor600,
          ),
          verticalSpace(8.0),
          Text(
            LocaleKeys.OTPMessage.tr(),
            style: TextStyleManager.font17TextColor400,
          ),
          verticalSpace(50.0),
          CustomPinCodeTextField(
             formKey: context.read<ForgotPasswordCubit>().verifyCodeFormKey,
            controller: context.read<ForgotPasswordCubit>().otpController,),
          verticalSpace(32.0),
          const ResendCodeView(),
          verticalSpace(42.0),
          VerifyCodeBlocListener(phone: phone),
        ],
      ),
    );
  }
}

import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/verify_otp_bloc_listener.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/verify_otp_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/back_icon_button.dart';
import '../../../lang/locale_keys.g.dart';
import 'widgets/resend_code.dart';

class VerifyOtpRegister extends StatelessWidget {
  final String phone;
  const VerifyOtpRegister({super.key, required this.phone});

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
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
              controller: context.read<RegisterCubit>().otpController,
              formKey: context.read<RegisterCubit>().otpFormKey,
            ),
            verticalSpace(32.0),
            const ResendCodeView(),
            verticalSpace(42.0),
            VerifyOtpBlocListener(phone: phone),
          ],
        ),
      ),
    );
  }
}

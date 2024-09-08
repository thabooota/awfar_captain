import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/assets_manager.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/reset_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/widgets/back_icon_button.dart';
import '../logic/forget_password/forget_password_cubit.dart';
import '../logic/forget_password/forget_password_state.dart';

class CompleteForgetPasswordScreen extends StatelessWidget {
  final String phone;
  const CompleteForgetPasswordScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: Text(
          'change password',
          style: TextStyleManager.font20BlackBold,
        ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordStates>(
            builder: (context, state) {
              ForgotPasswordCubit forgotPasswordCubit =
                  context.read<ForgotPasswordCubit>();

              return Form(
                key: forgotPasswordCubit.resetPasswordFormKey,
                child: Column(
                  children: [
                    CustomTextForm(
                      controller: forgotPasswordCubit.passwordController,
                      text: 'New Password',
                      inputType: TextInputType.visiblePassword,
                      validator: (value) => passwordValidation(value),
                      obscureText: forgotPasswordCubit.hidePassword,
                      suffixIcon: IconButton(
                        onPressed: () => forgotPasswordCubit
                            .emitChangeConfirmPasswordIconState(),
                        icon: SvgPicture.asset(
                          forgotPasswordCubit.hidePassword
                              ? AssetsManager.icShow
                              : AssetsManager.icHide,
                        ),
                      ),
                    ),
                    verticalSpace(20.h),
                    CustomTextForm(
                      controller: forgotPasswordCubit.confirmPasswordController,
                      text: 'Confirm New Password',
                      inputType: TextInputType.visiblePassword,
                      validator: (value) => confirmPasswordValidation(
                          value, forgotPasswordCubit.passwordController.text),
                      obscureText: forgotPasswordCubit.hidePassword,
                      suffixIcon: IconButton(
                        onPressed: () => forgotPasswordCubit
                            .emitChangeConfirmPasswordIconState(),
                        icon: SvgPicture.asset(
                          forgotPasswordCubit.hideConfirmPassword
                              ? AssetsManager.icShow
                              : AssetsManager.icHide,
                        ),
                      ),
                    ),
                    verticalSpace(30.h),
                    ResetPasswordBlocListener(phone: phone),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else if (password.length < 8) {
      return "password too short, minimum 8 characters";
    } else if (!AppRegex.isPasswordValid(password)) {
      return "Please Enter a strong password";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? confirmPassword, String password) {
    if (password != confirmPassword) {
      return "password confirmation not match password";
    } else {
      return null;
    }
  }
}

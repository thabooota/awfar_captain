import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/change_password_bloc_listener.dart';
import 'package:awfar_captain/features/home/ui/widgets/text_form_field_with_label_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/back_icon_button.dart';
import '../../../lang/locale_keys.g.dart';

class ChangeMyPasswordScreen extends StatelessWidget {
  const ChangeMyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.changePasswordHeader.tr()),
        leading: const BackIconButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              HomeCubit homeCubit = context.read<HomeCubit>();

              return Form(
                key: homeCubit.changePasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormFieldWithLabelItem(
                      label: LocaleKeys.oldPassword.tr(),
                      controller: homeCubit.oldPasswordController,
                      inputType: TextInputType.visiblePassword,
                      hidePassword: homeCubit.hideOldPassword,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            homeCubit.emitChangeOldPasswordIconState(),
                        icon: SvgPicture.asset(
                          homeCubit.hideOldPassword
                              ? AssetsManager.icShow
                              : AssetsManager.icHide,
                        ),
                      ),
                      validator: (value) => passwordValidation(value),
                    ),
                    verticalSpace(28.0),
                    TextFormFieldWithLabelItem(
                      label: LocaleKeys.newPassword.tr(),
                      controller: homeCubit.newPasswordController,
                      inputType: TextInputType.visiblePassword,
                      hidePassword: homeCubit.hidePassword,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            homeCubit.emitChangePasswordIconState(),
                        icon: SvgPicture.asset(
                          homeCubit.hidePassword
                              ? AssetsManager.icShow
                              : AssetsManager.icHide,
                        ),
                      ),
                      validator: (value) => passwordValidation(value),
                    ),
                    verticalSpace(28.0),
                    TextFormFieldWithLabelItem(
                      label: LocaleKeys.confirmNewPassword.tr(),
                      controller: homeCubit.confirmNewPasswordController,
                      validator: (value) => confirmPasswordValidation(
                        value,
                        homeCubit.newPasswordController.text,
                      ),
                      inputType: TextInputType.visiblePassword,
                      hidePassword: homeCubit.hideConfirmPassword,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            homeCubit.emitChangeConfirmPasswordIconState(),
                        icon: SvgPicture.asset(
                          homeCubit.hideConfirmPassword
                              ? AssetsManager.icShow
                              : AssetsManager.icHide,
                        ),
                      ),
                    ),
                    verticalSpace(28.0),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: ChangePasswordBlocListener(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? passwordValidation(String ?password) {
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

  String? confirmPasswordValidation(String confirmPassword, String password) {
    if (password != confirmPassword) {
      return "password confirmation not match password";
    } else {
      return null;
    }
  }
}
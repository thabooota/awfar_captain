import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/widgets/back_icon_button.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_state.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/add_details_bloc_listener.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/complete_register_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../lang/locale_keys.g.dart';

class CompleteRegisterScreen extends StatelessWidget {
  const CompleteRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
         LocaleKeys.addData.tr(),style:  TextStyleManager.font17blackBold, ),
        leading: const BackIconButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: BlocBuilder<RegisterCubit, RegisterStates>(
            builder: (context, state) {
              RegisterCubit registerCubit = context.read<RegisterCubit>();
              return Form(
                key: registerCubit.detailsFormKey,
                child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CompleteRegisterItem(
                    validator: (value) => nameValidation(value),
                    label: LocaleKeys.name.tr(),
                    hintText: LocaleKeys.enterYourName.tr(),
                    controller: registerCubit.nameController,
                    inputType: TextInputType.name, hidePassword: false,
                  ),
                  verticalSpace(28.0),
                  CompleteRegisterItem(
                    validator: (value) => emailValidation(value),
                    label: LocaleKeys.email.tr(),
                    hintText: LocaleKeys.enterYourEmail.tr(),
                    controller: registerCubit.emailController,
                    inputType: TextInputType.emailAddress, hidePassword: false,
                  ),
                  verticalSpace(28.0),
                  CompleteRegisterItem(
                    validator: (value) => passwordValidation(value),
                    label: LocaleKeys.password.tr(),
                    hintText:LocaleKeys.enterPassword.tr(),
                    controller: registerCubit.passwordController,
                    inputType: TextInputType.visiblePassword,
                    hidePassword: registerCubit.hidePassword,
                    suffixIcon: IconButton(
                      onPressed: () => context
                          .read<RegisterCubit>()
                          .emitChangePasswordIconState(),
                      icon: SvgPicture.asset(
                        registerCubit.hidePassword
                            ? AssetsManager.icShow
                            : AssetsManager.icHide,
                      ),
                    ),
                  ),
                  verticalSpace(28.0),
                  CompleteRegisterItem(
                    validator: (value) => confirmPasswordValidation(value, registerCubit.passwordController.text),
                    label: LocaleKeys.confirmPassword.tr(),
                    hintText: LocaleKeys.enterConfirmPassword.tr(),
                    controller: registerCubit.confirmPasswordController,
                    inputType: TextInputType.visiblePassword,
                    hidePassword: registerCubit.hideConfirmPassword,
                    suffixIcon: IconButton(
                      onPressed: () => context
                          .read<RegisterCubit>()
                          .emitChangeConfirmPasswordIconState(),
                      icon: SvgPicture.asset(
                        registerCubit.hideConfirmPassword
                            ? AssetsManager.icShow
                            : AssetsManager.icHide,
                      ),
                    ),
                  ),
                  verticalSpace(28.0),
                  const AddDetailsBlocListener(),
                ],
                            ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? nameValidation(String? name) {
    if (name == null || name.isEmpty || name.length < 3) {
      return "Please Enter a valid name";
    } else {
      return null;
    }
  }

  String? emailValidation(String? email) {
    if (email == null || email.isEmpty || !AppRegex.isEmailValid(email)) {
      return "Please Enter a valid email";
    } else {
      return null;
    }
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

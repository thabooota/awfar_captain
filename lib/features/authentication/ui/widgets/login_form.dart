import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/features/authentication/logic/login/login_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/login/login_state.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/login_bloc_listener.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import 'custom_text_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (BuildContext context, LoginStates state) {
        LoginCubit loginCubit = context.read<LoginCubit>();
        return Form(
          key: loginCubit.loginFormKey,
          child: Column(
              children: [
                CustomTextForm(
                  controller: loginCubit.phoneController,
                  inputType: TextInputType.phone,
                  validator: (value) => phoneValidation(value),
                  obscureText: false,
                  text: LocaleKeys.phoneHintText.tr(),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${generateCountryFlag()} +02", style: TextStyleManager.font17TextColor600,textAlign: TextAlign.center,),
                  ),
                ),
                verticalSpace(15.h),
                CustomTextForm(
                  controller: loginCubit.passwordController,
                  validator: (value) {
                    return passwordValidation(value);
                  },
                  obscureText: loginCubit.hidePassword,
                  text: LocaleKeys.passwordHintText.tr(),
                  suffixIcon: IconButton(
                    onPressed: () => loginCubit.emitChangePasswordIconState(),
                    icon: SvgPicture.asset(
                      loginCubit.hidePassword
                          ? AssetsManager.icShow
                          : AssetsManager.icHide,
                    ),
                  ), inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const LoginBlocListener(),
              ]
          ),
        );
      },
    );
  }
  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty || !AppRegex.isPhoneValid(phone)) {
      return "Please Enter a valid phone";
    } else {
      return null;
    }
  }


  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else if (password.length < 8) {
      return "password too short, minimum 8 characters"; }
    // } else if (!AppRegex.isPasswordValid(password)) {
    //   return "Please Enter a strong password";
    // }
      else {
      return null;
    }
  }
}

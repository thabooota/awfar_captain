import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/method_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../logic/forget_password/forget_password_cubit.dart';
import 'forgot_password_bloc_listener.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      decoration: const BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Form(
        key: context.read<ForgotPasswordCubit>().forgotPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextForm(
              obscureText: false,
              controller: context.read<ForgotPasswordCubit>().phoneController,
              inputType: TextInputType.phone,
              text: LocaleKeys.phoneHintText.tr(),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  MethodsManager.generateEgyptFlagWithCode(),
                  style: TextStyleManager.font17TextColor600,
                ),
              ),
              validator: (value) => phoneValidation(value),
            ),
            verticalSpace(36.0.h),
            const ForgotPasswordBlocListener(),
          ],
        ),
      ),
    );
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty || !AppRegex.isPhoneValid(phone)) {
      return "Please Enter a valid phone";
    } else {
      return null;
    }
  }
}

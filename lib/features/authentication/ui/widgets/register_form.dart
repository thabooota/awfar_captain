import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_state.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/register_bloc_listener.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import '../forget_password_screen.dart';
import 'custom_text_form.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
        builder: (context, state) {
          RegisterCubit registerCubit = context.read<RegisterCubit>();
          return Form(
              key: registerCubit.registerFormKey,
              child: Column(
                children: [
                  CustomTextForm(
                    obscureText: false,
                    validator: (value) => phoneValidation(value),
                    text: LocaleKeys.phoneHintText.tr(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${generateCountryFlag()} +02", style: TextStyleManager.font17blackBold,),
                    ),
                    inputType: TextInputType.phone,
                    controller: registerCubit.phoneController,
                  ),
                  verticalSpace(30.h),
                  const RegisterBlocListener(),
                ],
              ));
        },);
  }
  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty || !AppRegex.isPhoneValid(phone)) {
      return "Please Enter a valid phone";
    } else {
      return null;
    }
  }
}

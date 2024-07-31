import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/assets_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/back_icon_button.dart';

class CompleteForgetPasswordScreen extends StatelessWidget {
  const CompleteForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: Text(
          'change password',
          style: TextStyleManager.font20BlackBold,),
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
          child: Column(
            children: [
              CustomTextForm(
                text: 'New Password',
                inputType: TextInputType.visiblePassword,
                validator: (value) {},
                obscureText: false,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsManager.icHide),
                ),
              ),
              verticalSpace(20.h),
              CustomTextForm(
                text: 'Confirm New Password',
                inputType: TextInputType.visiblePassword,
                validator: (value) {},
                obscureText: false,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsManager.icHide),
                ),
              ),
              verticalSpace(30.h),
              AppTextButton(
                  appText: 'Send',
                  onTap: () => context.pushNamedAndRemoveUntil(
                    Routes.changePasswordDone,
                    predicate: (_) => false,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

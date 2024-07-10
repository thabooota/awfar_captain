import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/widgets/back_icon_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/complete_register_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../lang/locale_keys.g.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key});

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CompleteRegisterItem(
                label: LocaleKeys.name.tr(),
                hintText: LocaleKeys.enterYourName.tr(),
                controller: nameController,
                inputType: TextInputType.name, hidePassword: false,
              ),
              verticalSpace(28.0),
              CompleteRegisterItem(
                label: LocaleKeys.email.tr(),
                hintText: LocaleKeys.enterYourEmail.tr(),
                controller: emailController,
                inputType: TextInputType.emailAddress, hidePassword: false,
              ),
              verticalSpace(28.0),
              CompleteRegisterItem(
                label: LocaleKeys.password.tr(),
                hintText:LocaleKeys.enterPassword.tr(),
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
                hidePassword: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: SvgPicture.asset(
                    hidePassword ? AssetsManager.icShow : AssetsManager.icHide,
                  ),
                ),
              ),
              verticalSpace(28.0),
              CompleteRegisterItem(
                label: LocaleKeys.confirmPassword.tr(),
                hintText: LocaleKeys.enterConfirmPassword.tr(),
                controller: confirmPasswordController,
                inputType: TextInputType.visiblePassword,
                hidePassword: hideConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideConfirmPassword = !hideConfirmPassword;
                    });
                  },
                  icon: SvgPicture.asset(
                    hidePassword ? AssetsManager.icShow : AssetsManager.icHide,
                  ),
                ),
              ),
              verticalSpace(28.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppTextButton(
                  appText: LocaleKeys.btnSend.tr(),
                  onTap: () => context.pushNamed(Routes.addDecuments),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

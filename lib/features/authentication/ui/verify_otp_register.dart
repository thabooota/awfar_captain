import 'package:awfar_captain/features/authentication/ui/widgets/verify_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/back_icon_button.dart';

class VerifyOtpRegister extends StatelessWidget {
  const VerifyOtpRegister({super.key});

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
      body: const VerifyOTPWidget(route: Routes.completeRegister,),
    );
  }
}

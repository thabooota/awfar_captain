import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/back_icon_button.dart';
import '../../../lang/locale_keys.g.dart';

class WithdrawBalance extends StatelessWidget {
  const WithdrawBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
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
        title:  Text(LocaleKeys.withDrawMyBalance.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Text(
                'رصيدك الحالي : 403 جنية مصري',
                style: TextStyleManager.font17black400,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/home/ui/widgets/technical_support_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/back_icon_button.dart';
import '../../../lang/locale_keys.g.dart';

class TechnicalSupport extends StatelessWidget {
  const TechnicalSupport({super.key});

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
        centerTitle: true,
        title: Text(LocaleKeys.technicalSupport.tr()),
        shape: const Border(
            bottom: BorderSide(color: ColorManager.transparent, width: 0.0)),
        leading: const BackIconButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TechnicalSupportContainer(color: ColorManager.darkGrey,text:  LocaleKeys.technicalSupportMessage3.tr(),),
            verticalSpace(10.h),
            TechnicalSupportContainer(color: ColorManager.purple,text:  LocaleKeys.technicalSupportMessage2.tr(),),
            verticalSpace(10.h),
            TechnicalSupportContainer(color: ColorManager.babyBlue,text: LocaleKeys.technicalSupportMessage3.tr(),),
            verticalSpace(60.h),
            AppTextButton(appText: LocaleKeys.btnBack.tr(), onTap: () => context.pop()),
          ],
        ),
      ),
    );
  }
}

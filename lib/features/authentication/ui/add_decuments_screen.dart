import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/core/widgets/back_icon_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/add_decuments_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import '../../../lang/locale_keys.g.dart';

class AddDecumentsScreen extends StatelessWidget {
  const AddDecumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          LocaleKeys.addDecuments.tr(),
          style: TextStyleManager.font17blackBold,
        ),
        leading: const BackIconButton(),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: decuments.length,
                itemBuilder: (context, index) => AddDecumentsWidget(
                  text: decuments[index],
                ),
                separatorBuilder: (context, index) => Divider(
                  color: ColorManager.darkGrey,
                  endIndent: 20.h,
                  indent: 20.h,
                ),
                physics: const BouncingScrollPhysics(),
              ),
            ),
            verticalSpace(20.h),
            AppTextButton(
                appText: LocaleKeys.btnSend.tr(),
                onTap: () {
                  context.pushNamedAndRemoveUntil(Routes.home,
                      predicate: (_) => false);
                })
          ],
        ),
      ),
    );
  }
}

List<String> decuments = [
  'الصورة الشخصية',
  ' البطاقة الشخصية ( وجه )',
  ' البطاقة الشخصية ( ظهر البطاقة ) ',
  'رخصة القيادة ( وجه ) ',
  'رخصة القيادة ( ظهر الرخصة ) ',
  'رخصة السيارة  ( وجه ) ',
  'رخصة السيارة  ( ظهر ) ',
  'فيش جنائي',
  'صورة السيارة ( من الامام ) ',
  'صورة السيارة ( من الخلف ) ',
  'نوع المركبة ',
  'منطقة العمل',
];

import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/add_decuments_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/assets_manager.dart';

class AddDecumentsScreen extends StatelessWidget {
  const AddDecumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("ارفع مستنداتك", style: TextStyleManager.font17blackBold,),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Transform.rotate(
            angle: 3.14,
            child: SvgPicture.asset(AssetsManager.icArrowLeft),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: decu.length,
                itemBuilder: (context, index) =>  AddDecumentsWidget(text: decu[index],),
                separatorBuilder: (context, index) => Divider(
                  color: ColorManager.darkGrey,
                  endIndent: 20.h,
                  indent: 20.h,
                ),
                physics: const BouncingScrollPhysics(),
              ),
            ),
            verticalSpace(20.h),
            AppTextButton(appText: 'ارسال', onTap: () {})
          ],
        ),

      ),
    );
  }
}
List <String> decu = [
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
] ;

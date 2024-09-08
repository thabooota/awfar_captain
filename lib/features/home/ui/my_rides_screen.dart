import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/back_icon_button.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:  Text(LocaleKeys.myRides.tr()),
      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'اغسطس2023,31', 
                    style: TextStyleManager.font15Black500,
                  ),
                  Text(
                    'عند 8:32 am',
                    style: TextStyleManager.font10Black600.copyWith(
                    color: ColorManager.lighterGrey
                  ),
                  ),
                  Text(
                    'رقم الرحلة : 898522',
                    style: TextStyleManager.font10Black600.copyWith(
                    color: ColorManager.lighterGrey
                  ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '207.65 ج.م',
                    style: TextStyleManager.font15Black500,
                  ),
                  ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.green,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        'ملغي', style: TextStyleManager.font10Black600.copyWith(color: ColorManager.originalWhite),
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: () {},
                    )
                  ),
                ],
              )
            ],
          ),
        );
      }, separatorBuilder: (context, index) {
        return verticalSpace(10.h);
      }, itemCount: 10),
    );
  }
}

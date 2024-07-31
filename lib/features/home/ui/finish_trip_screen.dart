import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/widgets/app_text_button.dart';
import 'package:awfar_captain/core/widgets/back_icon_button.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';

class FinishTripScreen extends StatelessWidget {
  const FinishTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15.0 ,right: 15.0, top: 30),
        physics: const BouncingScrollPhysics(),
        children: [
        Card(
        elevation:3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
         child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey,
                blurRadius: 8,
                blurStyle: BlurStyle.normal,
                spreadRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
            gradient: LinearGradient(
              colors: ColorManager.blueColor,
            ),
          ),
          child: Column(
            children: [
              Text(LocaleKeys.completeTripHeader.tr(),style: TextStyleManager.font30Black600,textAlign: TextAlign.center,),
              verticalSpace(30.0.h),
              Text('Yussef ${LocaleKeys.willGiveYou.tr()}',style: TextStyleManager.font20BlackBold,),
              verticalSpace(8.0.h),
              Text('70 ${LocaleKeys.currency.tr()}',style: TextStyleManager.font30Black600,),
              verticalSpace(40.0.h),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  color: ColorManager.originalWhite
                ),
                child: Column(
                  children: [
                    Text(LocaleKeys.amountCollected.tr(), style: TextStyleManager.font20BlackBold,),
                  verticalSpace(20.h),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: ColorManager.lighterGrey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        cursorColor: ColorManager.green,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: ColorManager.lighterGrey,

                              )
                          ),
                            enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: ColorManager.lighterGrey,

                          )
                        )),
                      ),
                    ),
                    verticalSpace(30.0.h),
                    AppTextButton(appText: LocaleKeys.finishPayment.tr(), onTap: () => context.pushNamed(Routes.rating),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}

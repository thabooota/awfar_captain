import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/utils/assets_manager.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/ui/widgets/drawer_view.dart';

class CaptainGateScreen extends StatelessWidget {
  const CaptainGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        shape: const Border(
            bottom: BorderSide(color: ColorManager.transparent, width: 0.0)),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.scaffold,
          systemNavigationBarColor: ColorManager.scaffold,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: ColorManager.scaffold,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "${LocaleKeys.captainGate.tr()} \n Youssef Thabet",
          style: TextStyleManager.font17blackBold,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: ColorManager.scaffold,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        children: [
          Center(
            child: Text(
              '950 ${LocaleKeys.currency.tr()}',
              style: TextStyleManager.font25White600
                  .copyWith(color: ColorManager.originalBlack),
            ),
          ),
          verticalSpace(20.h),
          Card(
            elevation: 2,
            color: ColorManager.originalWhite,
            child: ListTile(
              title: Text(
                LocaleKeys.withDrawMyBalance.tr(),
                style: TextStyleManager.font20Gray400,
              ),
              leading: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: ColorManager.lightGrey,
                  child: SvgPicture.asset(AssetsManager.icMoney)),
              onTap: () {},
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            ),
          ),
          verticalSpace(15.h),
          Text(
            LocaleKeys.yourQualityReport.tr(),
            style: TextStyleManager.font20BlackBold,
          ),
          verticalSpace(15.h),
          Card(
            elevation: 2,
            color: ColorManager.originalWhite,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.generalStatus.tr(),
                        style: TextStyleManager.font17TextColor600,
                      ),
                      const Spacer(),
                      Text(
                        "💔 ضعيف",
                        style: TextStyleManager.font17TextColor600,
                      ),
                    ],
                  ),
                  verticalSpace(10.0.h),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.customerExperience.tr(),
                        style: TextStyleManager.font17TextColor600,
                      ),
                      const Spacer(),
                      Text(
                        "مقبول",
                        style: TextStyleManager.font17TextColor600
                            .copyWith(color: ColorManager.orange),
                      ),
                    ],
                  ),
                  verticalSpace(10.0.h),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.acceptanceRate.tr(),
                        style: TextStyleManager.font17TextColor600,
                      ),
                      const Spacer(),
                      Text(
                        "0 %",
                        style: TextStyleManager.font17TextColor600
                            .copyWith(color: ColorManager.orange),
                      ),
                    ],
                  ),
                  verticalSpace(10.0.h),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.percentageOfCompletedTrips.tr(),
                        style: TextStyleManager.font17TextColor600,
                      ),
                      const Spacer(),
                      Text(
                        "50 %",
                        style: TextStyleManager.font17TextColor600
                            .copyWith(color: ColorManager.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(15.h),
          Card(
            color: ColorManager.originalWhite,
            elevation: 2,
            child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios)),
                      Text(
                        '28-4-2024 : 21-4-2024',
                        style: TextStyleManager.font20BlackBold,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  verticalSpace(20.h),
                  Row(
                    children: [
                    Text(
                      LocaleKeys.workingHours.tr(),
                      style: TextStyleManager.font17TextColor600,
                    ),
                    const Spacer(),
                      Text('0 H 10 M', style: TextStyleManager.font17TextColor600,),
                ],
              ),
              ],
              ),
            ),
          ),
          verticalSpace(10.h),
          Text(LocaleKeys.myRides.tr(), style: TextStyleManager.font20BlackBold,),
          verticalSpace(10.h),
          Card(
            elevation: 2,
            color: ColorManager.originalWhite,
            child: ListView.separated(
              padding:  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Mohamed', style: TextStyleManager.font17Black700,),
                    const Spacer(),
                    Text('35.4 ج.م', style: TextStyleManager.font17Black700,),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('#123456', style: TextStyleManager.font17Black700.copyWith(color:ColorManager.lighterGrey),))
              ],
            ),
              separatorBuilder:(context, index) => const Divider(
                indent: 20,
                endIndent: 20,
                color: ColorManager.lightGrey,
              ),
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}

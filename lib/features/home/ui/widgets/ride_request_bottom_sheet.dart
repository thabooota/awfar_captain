import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class RideRequestBottomSheet extends StatelessWidget {
  const RideRequestBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network("https://scontent.fcai19-6.fna.fbcdn.net/v/t39.30808-1/451371717_3869431286606994_5963826142988558334_n.jpg?stp=dst-jpg_p160x160&_nc_cat=102&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeEOWSKKtDlYfBzd79VnEiL__SRoExsbuOz9JGgTGxu47EAxjjgmrt_YijOCAzDgS85llnRuCg0dAIONAVq0vI0r&_nc_ohc=cHUPiv7aFRIQ7kNvgGwo6-9&_nc_ht=scontent.fcai19-6.fna&oh=00_AYB1saN1E6AfWKtxV9PIKR5HPEBa8N-5WB-PYgqn2vCHQg&oe=66A48334", width: 60.w,)),
            horizontalSpace(3.w),
            Expanded(child: Text('Mohamed Ahmed', style: TextStyleManager.font17TextColor600.copyWith(overflow: TextOverflow.fade),)),
            horizontalSpace(10.w),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: ColorManager.originalWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: ColorManager.yellow,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "4.6",
                    style: TextStyleManager.font13Black700,
                  ),
                  horizontalSpace(4.0),
                  SvgPicture.asset(AssetsManager.icFavorites),
                ],
              ),
            ),
            horizontalSpace(30.w),
            Column(
              children: [
                Text('70 ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17TextColor600,),
                Text('36 km', style: TextStyleManager.font17DarkGrey400,),
              ],
            )
          ],
        ),
        verticalSpace(10.h),
        const Divider(),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.meetingLocation.tr(), style: TextStyleManager.font13Black600),
                Text('85 شارع فيصل الرئيسي', style: TextStyleManager.font17TextColor400),
              ],

            ),
            const Spacer(),
            Text('00:50', style: TextStyleManager.font30Black600,),

          ],
        ),
        verticalSpace(10.h),
        const Divider(),
        Text(LocaleKeys.arrivalLocation.tr(), style: TextStyleManager.font13Black600),
        Text('85 شارع عباس العقاد مدينة نصر', style: TextStyleManager.font17TextColor400,),
        verticalSpace(10.h),
        const Divider(),
        Text(LocaleKeys.tripCost.tr(), style: TextStyleManager.font13Black700,),
        Row(
          children: [
            Text(LocaleKeys.cash.tr(),style: TextStyleManager.font17Black700,),
            const Spacer(),
            Text('80 ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700),
            horizontalSpace(50.w),
          ],),
        Row(
          children: [
            Text(LocaleKeys.discount.tr(),style: TextStyleManager.font17Black700,),
            const Spacer(),
            Text('10 ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700),
            horizontalSpace(50.w),
          ],),
        Row(
          children: [
            Text(LocaleKeys.totalPayment.tr(),style: TextStyleManager.font17Black700,),
            const Spacer(),
            Text('70 ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700),
            horizontalSpace(50.w),
          ],),
        verticalSpace(10.h),
        const Divider(),
        verticalSpace(40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.read<HomeCubit>().changeBottomSheetState(BottomSheetStates.meetClient);
                },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ColorManager.cyan,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.call, color: ColorManager.originalWhite,),
                    Text(LocaleKeys.acceptRide.tr(), style: TextStyleManager.font15Black600.copyWith(color: ColorManager.originalWhite),),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
context.read<HomeCubit>().changeBottomSheetState(BottomSheetStates.searchForRides);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ColorManager.red,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.delete_forever, color: ColorManager.originalWhite,),
                    Text(LocaleKeys.refuseRide.tr(), style: TextStyleManager.font15Black600.copyWith(color: ColorManager.originalWhite),),
                  ],
                ),
              ),
            ),
          ],),
        verticalSpace(30.h),
      ],
    );
  }
}

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/features/home/data/models/response/trip_accepted_response.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
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
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
        if(state is UserRejectedTrip)
          {
            Navigator.pop(context);
            AnimatedSnackBar.material(
              LocaleKeys.userCanceledTrip.tr(),
              type: AnimatedSnackBarType.warning,
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            ).show(context);
            context.read<HomeCubit>().changeBottomSheetState(state: BottomSheetStates.searchForRides);
          }
        if(state is AcceptedTripLoadingState || state is RejectedTripLoadingState)
          {
            showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(
              color: ColorManager.green,
            )),);
          } else if(state is AcceptedTripSuccessState) {
          Navigator.pop(context);
          if(context.read<HomeCubit>().restTripResponse!.data.time == null && context.read<HomeCubit>().restTripResponse!.data.date == null) {
              context.read<HomeCubit>().changeBottomSheetState(
                    state: BottomSheetStates.meetClient,
                  );
          } else {
            context.read<HomeCubit>().changeBottomSheetState(state :BottomSheetStates.searchForRides,);
          }
        } else if(state is AcceptedTripFailureState || state is AcceptedTripFailureState ) {
          Navigator.pop(context);
          AnimatedSnackBar.material(
            state.errorMessage,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        } else if (state is RejectedTripSuccessState)
          {
            Navigator.pop(context);
            context.read<HomeCubit>().changeBottomSheetState(state : BottomSheetStates.searchForRides,);
          }
      },
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(AssetsManager.imgProfileUser, width: 60.w,)),
              horizontalSpace(3.w),
              Expanded(child: Text(cubit.restTripResponse!.data.Client_Name, style: TextStyleManager.font17TextColor600.copyWith(overflow: TextOverflow.fade),)),
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
                      "3.6",
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
                  Text('${cubit.restTripResponse!.data.price}${LocaleKeys.currency.tr()}', style: TextStyleManager.font17TextColor600,),
                  Text('${cubit.routesResponse.routes[0].distanceMeters /1000}', style: TextStyleManager.font17DarkGrey400,),
                ],
              )
            ],
          ),
          verticalSpace(10.h),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.meetingLocation.tr(), style: TextStyleManager.font13Black600, overflow: TextOverflow.fade,),
              Text(cubit.restTripResponse!.data.form, style: TextStyleManager.font17TextColor400),
            ],

          ),
          verticalSpace(10.h),
          const Divider(),
          Text(LocaleKeys.arrivalLocation.tr(), style: TextStyleManager.font13Black600),
          Text(cubit.restTripResponse!.data.to, style: TextStyleManager.font17TextColor400,),
          verticalSpace(10.h),
          const Divider(),
          Text(LocaleKeys.tripCost.tr(), style: TextStyleManager.font13Black700,),
          Row(
            children: [
              Text(LocaleKeys.cash.tr(),style: TextStyleManager.font17Black700,),
              const Spacer(),
              Text('${cubit.restTripResponse!.data.price} ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700),
              horizontalSpace(50.w),
            ],),
          Row(
            children: [
              Text(LocaleKeys.discount.tr(),style: TextStyleManager.font17Black700,),
              const Spacer(),
              Text('0 ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700),
              horizontalSpace(50.w),
            ],),
          Row(
            children: [
              Text(LocaleKeys.totalPayment.tr(),style: TextStyleManager.font17Black700,),
              const Spacer(),
              Text('${cubit.restTripResponse!.data.price} ${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700),
              horizontalSpace(50.w),
            ],),
          verticalSpace(10.h),
          const Divider(),
          if(cubit.restTripResponse!.data.time != null && cubit.restTripResponse!.data.date != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.scheduleTrip.tr(), style:  TextStyleManager.font20TextColor600,),verticalSpace(10.0.h),
                Row(
                  children: [
                    Text(LocaleKeys.time.tr(),style: TextStyleManager.font17Black700,),
                    const Spacer(),
                    Text('${
                        int.parse(cubit.restTripResponse!.data.time!.substring(0,2)) > 12
                            ? int.parse(cubit.restTripResponse!.data.time!.substring(0,2)) - 12 :
                        cubit.restTripResponse!.data.time!.substring(0,2)} : '
                        '${cubit.restTripResponse!.data.time!.substring(3,5)} ${
                        int.parse(cubit.restTripResponse!.data.time!.substring(0,2)) > 12 ? 'pm' : 'am'}', style: TextStyleManager.font17Black700),
                  ],),
                Row(
                  children: [
                    Text(LocaleKeys.date.tr(),style: TextStyleManager.font17Black700,),
                    const Spacer(),
                    Text('${cubit.restTripResponse!.data.date}', style: TextStyleManager.font17Black700),
                  ],),
              ],
            ),
          verticalSpace(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => context.read<HomeCubit>().emitAcceptedTripRequestState(),
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
                  context.read<HomeCubit>().emitRejectedTripRequestState();
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
      },
    );
  }
}

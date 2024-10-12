import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/meeting_client_listener.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../logic/home_cubit.dart';

class MeetClientBottomSheet extends StatelessWidget {
  const MeetClientBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    AssetsManager.imgProfileUser,
                    width: 60.w,
                  ),
                ),
                horizontalSpace(3.w),
                Expanded(
                    child: Text(
                  cubit.tripAcceptedResponse!.Client.name,
                  style: TextStyleManager.font17TextColor600
                      .copyWith(overflow: TextOverflow.fade),
                )),
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
                    Text(
                      '70 ${LocaleKeys.currency.tr()}',
                      style: TextStyleManager.font17TextColor600,
                    ),
                    Text(
                      '36 km',
                      style: TextStyleManager.font17DarkGrey400,
                    ),
                  ],
                )
              ],
            ),
            verticalSpace(10.h),
            const Divider(),
            Text(LocaleKeys.meetingLocation.tr(),
                style: TextStyleManager.font13Black600),
            Text(cubit.tripAcceptedResponse!.From,
                style: TextStyleManager.font17TextColor400),
            verticalSpace(10.h),
            const Divider(),
            Text(LocaleKeys.arrivalLocation.tr(),
                style: TextStyleManager.font13Black600),
            Text(
              cubit.tripAcceptedResponse!.To,
              style: TextStyleManager.font17TextColor400,
            ),
            verticalSpace(10.h),
            const Divider(),
            Text(
              LocaleKeys.tripCost.tr(),
              style: TextStyleManager.font13Black700,
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.cash.tr(),
                  style: TextStyleManager.font17Black700,
                ),
                const Spacer(),
                Text(
                    '${cubit.tripAcceptedResponse!.Price}${LocaleKeys.currency.tr()}',
                    style: TextStyleManager.font17Black700),
                horizontalSpace(50.w),
              ],
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.discount.tr(),
                  style: TextStyleManager.font17Black700,
                ),
                const Spacer(),
                Text('0 ${LocaleKeys.currency.tr()}',
                    style: TextStyleManager.font17Black700),
                horizontalSpace(50.w),
              ],
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.totalPayment.tr(),
                  style: TextStyleManager.font17Black700,
                ),
                const Spacer(),
                Text(
                    '${cubit.tripAcceptedResponse!.Price} ${LocaleKeys.currency.tr()}',
                    style: TextStyleManager.font17Black700),
                horizontalSpace(50.w),
              ],
            ),
            verticalSpace(10.h),
            const Divider(),
            verticalSpace(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  AssetsManager.icCall,
                  width: 50.w,
                ),
                GestureDetector(
                    onTap: () {
                      cubit.initializePusherNotifications(
                          onEvent: cubit.onChat,
                          channelName:
                              "message.Driver.${SharedPreferencesManager.getData(key: PrefsManager.driverId)}");
                    },
                    child: Image.asset(
                      AssetsManager.icChat,
                      width: 50.w,
                    )),
              ],
            ),
            verticalSpace(30.h),
            const ClientMeetingListener(),
          ],
        );
      },
    );
  }
}

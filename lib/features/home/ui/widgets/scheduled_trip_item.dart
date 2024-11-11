import 'package:awfar_captain/core/app_cubit/app_cubit.dart';
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/features/home/data/models/response/get_all_scheduled_trips_response.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../lang/locale_keys.g.dart';

class ScheduledTripItem extends StatelessWidget {
  final bool isEnabled;
  final void Function()? onTap;
  final GetAllScheduledTripsResponse tripEntity;

  const ScheduledTripItem({
    super.key,
    required this.isEnabled,
    required this.onTap,
    required this.tripEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.originalWhite,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${LocaleKeys.date.tr()} : ${tripEntity.date}",
                          style: TextStyleManager.font14TextColor500,
                        ),
                        verticalSpace(8.0),
                        Text(
                          "${LocaleKeys.date.tr()} : ${int.parse(tripEntity.time.substring(0,2)) > 12
                              ? int.parse(tripEntity.time.substring(0,2)) - 12 : tripEntity.time.substring(0,2)} :"
                              " ${tripEntity.time.substring(3,5)} ${int.parse(tripEntity.time.substring(0,2)) > 12 ? 'pm' : 'am' }",
                          style: TextStyleManager.font10Grey400,
                        ),
                        verticalSpace(4.0),
                        Text(
                          "${LocaleKeys.ScheduledClientName.tr()} : ${tripEntity.client.name}",
                          style: TextStyleManager.font12Grey400,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${tripEntity.price} ${LocaleKeys.currency.tr()}",
                        style: TextStyleManager.font14TextColor500,
                      ),
                      verticalSpace(20.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: tripEntity.status == "accepted"
                                  ? ColorManager.green
                                  : tripEntity.status == "canceled"
                                  ? Colors.redAccent
                                  : ColorManager.green,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              tripEntity.status,
                              style: TextStyleManager.font10White700.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (!isEnabled) ...[
                            horizontalSpace(12.0),
                            Transform.rotate(
                              angle: 4.71238898,
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                              ),
                            ),
                          ]
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(5.0),
            if (isEnabled) ...[
              const Divider(
                color: Color(0xFFDBE9F5),
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "- ${tripEntity.from}",
                                style: TextStyleManager.font14Grey400,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              verticalSpace(4.0),
                              Text(
                                "- ${tripEntity.to}",
                                style: TextStyleManager.font14Grey400,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(5.0),
                        AppTextButton(
                          appText: LocaleKeys.meetingClient.tr(),
                          onTap: () {
                            // todo: track order
                            context.read<HomeCubit>().scheduledTripsResponse = tripEntity;
                            context.read<HomeCubit>().scheduleTrip = true;
                            context.pop();
                              context.read<HomeCubit>().changeBottomSheetState(state :BottomSheetStates.meetClient,);
                          },
                          textStyle: TextStyleManager.font10White700,
                          minimumSize: Size(70.w, 35.h),
                          backgroundColor: Colors.teal,
                          borderRadius: 15.0,
                        ),
                      ],
                    ),
                    const Divider(
                      height: 20.0,
                    ),
                    Wrap(
                      spacing: 50.0,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          "${LocaleKeys.ScheduledClientName.tr()} : ${tripEntity.client.name}",
                          style: TextStyleManager.font14Grey400,
                        ),
                        verticalSpace(13.h),
                        Text(
                          tripEntity.client.Phone,
                          style: TextStyleManager.font14Grey400,
                        ),
                      ],
                    ),
                    verticalSpace(4.0),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.totalTripCost.tr(),
                          style: TextStyleManager.font14TextColor500,
                        ),
                        const Spacer(),
                        Text(
                          "${tripEntity.price} ${LocaleKeys.currency.tr()}",
                          style: TextStyleManager.font14TextColor500,
                        ),
                        horizontalSpace(12.0),
                        Transform.rotate(
                          angle: 1.57079633,
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../data/entity/trip_entity.dart';

class MyTripsItem extends StatelessWidget {
  final bool isEnabled;
  final void Function()? onTap;
  final TripEntity tripEntity;

  const MyTripsItem({
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
                  Column(
                    children: [
                      Text(
                        tripEntity.date,
                        style: TextStyleManager.font14TextColor500,
                      ),
                      verticalSpace(8.0),
                      Text(
                        tripEntity.time,
                        style: TextStyleManager.font10Grey400,
                      ),
                      verticalSpace(4.0),
                      Text(
                        "${LocaleKeys.tripNumber.tr()} : ${tripEntity.tripNumber}",
                        style: TextStyleManager.font12Grey400,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${tripEntity.finalTotalCost} ج.م",
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
                              color: tripEntity.status == "pending"
                                  ? Colors.orangeAccent
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
                              Text(
                                "- ${tripEntity.to}",
                                style: TextStyleManager.font14Grey400,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        AppTextButton(
                          appText: LocaleKeys.reportForTrip.tr(),
                          onTap: () => context.pushNamed(
                            Routes.reportMyTrips,
                            arguments: tripEntity.tripNumber,
                          ),
                          textStyle: TextStyleManager.font10White700,
                          minimumSize: Size(70.w, 35.h),
                          backgroundColor: const Color(0xFFFC4974),
                          borderRadius: 15.0,
                        ),
                      ],
                    ),
                    verticalSpace(4.0),
                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.coupon.tr()} ",
                          style: TextStyleManager.font14Grey400,
                        ),
                        const Spacer(),
                        Text(
                          tripEntity.coupon,
                          style: TextStyleManager.font14Grey400,
                        ),
                      ],
                    ),
                    verticalSpace(4.0),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.tripCost.tr(),
                          style: TextStyleManager.font14Grey400,
                        ),
                        const Spacer(),
                        Text(
                          "${tripEntity.cost} ج.م ",
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
                          "${tripEntity.finalTotalCost} ج.م ",
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
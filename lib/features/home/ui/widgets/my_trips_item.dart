import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class MyTripsItem extends StatelessWidget {
  final bool isEnabled;
  final void Function()? onTap;

  const MyTripsItem({
    super.key,
    required this.isEnabled,
    required this.onTap,
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
                        "اغسطس 31, 2023",
                        style: TextStyleManager.font14TextColor500,
                      ),
                      verticalSpace(8.0),
                      Text(
                        "عند 8:32 pm",
                        style: TextStyleManager.font10Grey400,
                      ),
                      verticalSpace(4.0),
                      Text(
                        "رقم الطلب : 898522",
                        style: TextStyleManager.font12Grey400,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "207.65 ج.م",
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
                              color: ColorManager.green,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "ملغي",
                              style: TextStyleManager.font10White700.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (!isEnabled) ...[
                            horizontalSpace(12.0),
                            Transform.rotate(
                              angle: 1.57079633,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "من شبرا الخيمة",
                              style: TextStyleManager.font14Grey400,
                            ),
                            Text(
                              "وسط البلد ميدان التحرير",
                              style: TextStyleManager.font14Grey400,
                            ),
                          ],
                        ),
                        const Spacer(),
                        AppTextButton(
                          appText: "الابلاغ عن الرحلة",
                          onTap: () => context.pushNamed(Routes.reportMyTrips),
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
                          "كوبون ",
                          style: TextStyleManager.font14Grey400,
                        ),
                        Spacer(),
                        Text(
                          "- 00.00",
                          style: TextStyleManager.font14Grey400,
                        ),
                      ],
                    ),
                    verticalSpace(4.0),
                    Row(
                      children: [
                        Text(
                          "تكلفة الرحلة ",
                          style: TextStyleManager.font14Grey400,
                        ),
                        Spacer(),
                        Text(
                          "00.00 ج.م ",
                          style: TextStyleManager.font14Grey400,
                        ),
                      ],
                    ),
                    verticalSpace(4.0),
                    Row(
                      children: [
                        Text(
                          "اجمالي التكلفة",
                          style: TextStyleManager.font14TextColor500,
                        ),
                        Spacer(),
                        Text(
                          "00.00 ج.م ",
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

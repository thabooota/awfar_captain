import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class OfflineBottomSheet extends StatelessWidget {
  const OfflineBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.lighterGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(LocaleKeys.youOffline.tr(), style: TextStyleManager.font25White600.copyWith(color: ColorManager.originalBlack),)),
    );
  }
}

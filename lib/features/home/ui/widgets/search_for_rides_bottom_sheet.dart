import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/ui/home_screen.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class SearchForRidesBottomSheet extends StatelessWidget {
  const SearchForRidesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8.0),
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.lighterGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                context.read<HomeCubit>().changeBottomSheetState(BottomSheetStates.rideRequest);
              },
              child: Image.asset(AssetsManager.icSearch, width: 60.w,)),
          horizontalSpace(10.w),
          Text(LocaleKeys.searchForRides.tr(), style: TextStyleManager.font25White600.copyWith(color: ColorManager.originalBlack),),
        ],
      ),
    );
  }
}

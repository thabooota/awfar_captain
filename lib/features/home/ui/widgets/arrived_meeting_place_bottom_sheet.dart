import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../logic/home_cubit.dart';

class ArrivedMeetingPlaceBottomSheet extends StatelessWidget {
  const ArrivedMeetingPlaceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          "${LocaleKeys.youOnWay.tr()} \n 85 شارع عباس العقاد",
          style: TextStyleManager.font17TextColor400,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.read<HomeCubit>().changeBottomSheetState(BottomSheetStates.startTrip);
          },
          child: Container(
            width: 90.w,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: ColorManager.cyan,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(LocaleKeys.arrivalLocation.tr(), style: TextStyleManager.font15Black600,
              textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}

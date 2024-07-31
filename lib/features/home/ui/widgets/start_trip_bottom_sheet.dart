import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../logic/home_cubit.dart';

class StartTripBottomSheet extends StatelessWidget {
  const StartTripBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                LocaleKeys.youOnWay.tr(),
                style: TextStyleManager.font17TextColor400,
                overflow: TextOverflow.fade,
              ),
              Text(
                ' شارع عباس العقاد - مدينة نصر',
                style: TextStyleManager.font17TextColor400,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<HomeCubit>().changeBottomSheetState(BottomSheetStates.endTrip);
          },
          child: Container(
            width: 90.w,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: ColorManager.cyan,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(LocaleKeys.startTrip.tr(), style: TextStyleManager.font15Black600,
              textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}

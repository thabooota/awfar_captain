import 'package:awfar_captain/core/app_cubit/app_cubit.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class MyTripsWidget extends StatelessWidget {
  const MyTripsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CaptainGateCubit cubit = context.read<CaptainGateCubit>();
    return Card(
      elevation: 2,
      color: ColorManager.originalWhite,
      child: ListView.separated(
        padding:  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(cubit.myReport!.TripCompleted[index].client.toString(), style: TextStyleManager.font17Black700,),
                const Spacer(),
                Text('${cubit.myReport!.TripCompleted[index].price}${LocaleKeys.currency.tr()}', style: TextStyleManager.font17Black700,),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('#${cubit.myReport!.TripCompleted[index].trip_number}', style: TextStyleManager.font17Black700.copyWith(color:ColorManager.lighterGrey),))
          ],
        ),
        separatorBuilder:(context, index) => const Divider(
          indent: 20,
          endIndent: 20,
          color: ColorManager.lightGrey,
        ),
        itemCount: cubit.myReport!.TripCompleted.length,
      ),
    );
  }
}

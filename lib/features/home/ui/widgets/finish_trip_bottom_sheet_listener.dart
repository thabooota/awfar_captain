import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_style_manager.dart';


class FinishTripBottomSheetListener extends StatelessWidget {
  const FinishTripBottomSheetListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is UpdateStatusTripLoadingState)
        {
          showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(
            color: ColorManager.green,
          )));
        } else if(state is UpdateStatusTripSuccessState)
        {
          Navigator.pop(context);
          context.pushNamed(
            Routes.finishTrip,
          );
        }
        else if(state is UpdateStatusTripFailureState)
        {
          Navigator.pop(context);
          AnimatedSnackBar.material(
            state.errorMessage,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
      },
      child:   GestureDetector(
        onTap: () {
          context.read<HomeCubit>().emitUpdateDriverStatus(status: "completed");
        },
        child: Container(
          width: 90.w,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: ColorManager.cyan,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(LocaleKeys.finishTrip.tr(), style: TextStyleManager.font15Black600,
            textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
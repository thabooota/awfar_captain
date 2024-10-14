import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../lang/locale_keys.g.dart';

class FinishTripBlocListener extends StatelessWidget {
  const FinishTripBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // if (state is CostTripSuccessState) {
        //     context.pushNamedAndRemoveUntil(
        //       Routes.rating,
        //       predicate: (_) => false,
        //   );
        //   AnimatedSnackBar.material(
        //     state.massageResponse.message,
        //     type: AnimatedSnackBarType.success,
        //     animationCurve: Curves.fastEaseInToSlowEaseOut,
        //     mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        //   ).show(context);
        // }
        // if (state is CostTripFailureState) {
        //   AnimatedSnackBar.material(
        //     state.errorMessage,
        //     type: AnimatedSnackBarType.error,
        //     animationCurve: Curves.fastEaseInToSlowEaseOut,
        //     mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        //   ).show(context);
        // }
      },
      builder: (context, state) => AnimatedCrossFade(
        firstChild: AppTextButton(
          appText: LocaleKeys.finishPayment.tr(),
          onTap: () {
            context.pushNamed(Routes.rating);
           // validateThenDoFinishTrip(context.read<HomeCubit>());
          },
        ),
        secondChild: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: ColorManager.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: ColorManager.originalWhite, size: 35.0),
          ),
        ),
        crossFadeState: state is CostTripLoadingState
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  void validateThenDoFinishTrip(HomeCubit cubit) {
    if (cubit.tripCostFormKey.currentState!.validate()) {
      cubit.emitTripCostState();
    }
  }
}

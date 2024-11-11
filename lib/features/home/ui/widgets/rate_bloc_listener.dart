import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_text_button.dart';

class RateBlocListener extends StatelessWidget {
  const RateBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is RateClientLoadingState)
        {
          showDialog(context: context, builder: (context) => const Center(
              child: CircularProgressIndicator(
            color: ColorManager.green,
          )
            ,),);
        } else if(state is RateClientSuccessState)
        {
          Navigator.pop(context);
          getIt.reset().then(
                (_) {
              setupGetIt().then(
                    (value) {
                      print("anaaaaaaaaaaaaaaaa hena");
                  return NavigationService.navigateToAndRemoveAll(
                      Routes.home
                  );
                },
              );
            },
          );
        }
        else if(state is RateClientFailureState)
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  AppTextButton(
            appText: LocaleKeys.btnSend.tr(),
            onTap: () {
              context.read<HomeCubit>().emitRateClientStates();
            }
        ),
      ),
    );
  }
}
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_text_button.dart';

class ClientMeetingListener extends StatelessWidget {
  const ClientMeetingListener({super.key});

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
          context.read<HomeCubit>().changeBottomSheetState(BottomSheetStates.arrivingPlace);
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
      child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppTextButton(appText: LocaleKeys.meetingClient.tr(), onTap: () {
          context.read<HomeCubit>().emitUpdateDriverStatus(status: "waiting");
        }),
      ),
    );
  }
}
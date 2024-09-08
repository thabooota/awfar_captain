import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../logic/forget_password/forget_password_cubit.dart';
import '../../logic/forget_password/forget_password_state.dart';


class ResetPasswordBlocListener extends StatelessWidget {
  final String phone;
  const ResetPasswordBlocListener({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          context.pushNamedAndRemoveUntil(Routes.changePasswordDone,
              predicate: (_) => false);
          AnimatedSnackBar.material(
            state.resetPasswordResponse.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
        if (state is ResetPasswordFailureState) {
          AnimatedSnackBar.material(
            state.error,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
      },
      builder: (context, state) => AnimatedCrossFade(
        firstChild: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppTextButton(
            appText: LocaleKeys.btnSend.tr(),
            onTap: () => validateThenDoResetPassword(context.read<ForgotPasswordCubit>()),
          ),
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
              color: ColorManager.originalWhite,
              size: 35.0,
            ),
          ),
        ),
        crossFadeState: state is ResetPasswordLoadingState
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  void validateThenDoResetPassword(ForgotPasswordCubit cubit) {
    if (cubit.resetPasswordFormKey.currentState!.validate()) {
      cubit.emitResetPasswordState(phone: phone);
    }
  }
}

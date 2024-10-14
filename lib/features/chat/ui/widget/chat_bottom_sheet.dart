import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      height: 80.0,
      decoration: const BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        border: Border(
          top: BorderSide(
            color: ColorManager.lightGrey,
          ),
        ),
      ),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return AnimatedCrossFade(
            firstChild: Form(
              key: context.read<HomeCubit>().chatFormKey,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextForm(
                      controller: context.read<HomeCubit>().messageController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "can't be send empty message'";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.text,
                      text: "",
                      obscureText: false,
                    ),
                  ),
                  horizontalSpace(8.0),
                  IconButton(
                    onPressed: () => validateThenSendMessage(
                      context.read<HomeCubit>(),
                    ),
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
            secondChild: Center(
              child: LoadingAnimationWidget.waveDots(
                color: ColorManager.green,
                size: 40,
              ),
            ),
            crossFadeState: state is SendMessageLoadingState
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 900),
          );
        },
      ),
    );
  }

  void validateThenSendMessage(HomeCubit cubit) {
    if (cubit.chatFormKey.currentState!.validate()) {
      cubit.emitSendMessageState();
    }
  }
}
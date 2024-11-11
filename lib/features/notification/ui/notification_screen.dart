import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/notification/ui/widgets/notification_item.dart';
import 'package:awfar_captain/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/back_icon_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title:  Text(LocaleKeys.notifications.tr(), style: TextStyleManager.font20TextColor600,),
        leading: const BackIconButton(),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        if(state is GetAllNotificationsLoadingState)
          {
            return Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: ColorManager.green, size: 35.0));
          }else {
          if(context.read<HomeCubit>().myNotifications.isNotEmpty) {
            return ListView.builder(
              itemCount: context.read<HomeCubit>().myNotifications.length,
              itemBuilder: (context, index) => NotificationItem(
                notification: context.read<HomeCubit>().myNotifications[index],
              ),
            );
          } else {
            return Center(child: Text(LocaleKeys.noNotificationsFounded.tr()));
          }
        }
      },
      ),
    );
  }
}

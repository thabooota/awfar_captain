import 'package:awfar_captain/features/notification/ui/widgets/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/back_icon_button.dart';

List<NotificationModel> notifications = const [
  NotificationModel(
      message: "لقد وصلت الى وجهتك يرجي دفع 75 جنية للسائق",
      isSystemNotification: true),
  NotificationModel(
      message: "لديك كوبون خصم بنسبة 15 % بحد اقصي 20 جنية",
      isSystemNotification: false),
  NotificationModel(
      message: "لديك كوبون خصم بنسبة 15 % بحد اقصي 20 جنية",
      isSystemNotification: false),
  NotificationModel(
      message: "لديك كوبون خصم بنسبة 15 % بحد اقصي 20 جنية",
      isSystemNotification: false),
  NotificationModel(
      message: "لقد وصلت الى وجهتك يرجي دفع 75 جنية للسائق",
      isSystemNotification: true),
];

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: AppBar(
        title: const Text("الاشعارات"),
        leading: const BackIconButton(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) => NotificationItem(
          notification: notifications[index],
        ),
      ),
    );
  }
}

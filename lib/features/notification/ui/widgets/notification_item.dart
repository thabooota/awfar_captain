import 'package:awfar_captain/features/notification/data/response/get_all_notifications_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class NotificationItem extends StatelessWidget {
  final GetAllNotificationsResponse notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.originalWhite,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
      margin: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsManager.icSystemNotification,
            width: 50.0,
          ),
          horizontalSpace(14.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 notification.title,
                style: TextStyleManager.font17TextColor600,
              ),
              verticalSpace(8.0),
              Text(
                notification.body,
                style: TextStyleManager.font10Black600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

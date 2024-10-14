import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../data/models/response/get_meassage_response.dart';

class MessageItem extends StatelessWidget {
  final bool clint;
  final MessageInfo message;

  const MessageItem({super.key, required this.clint, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: clint
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: EdgeInsetsDirectional.only(
          end: clint ? 0.0 : 50.0.w,
          start: clint ? 50.0.w : 0.0,
        ),
        decoration: BoxDecoration(
          color:
          clint ? ColorManager.originalBlack : ColorManager.originalWhite,
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(16.0),
            topEnd: const Radius.circular(16.0),
            bottomStart: Radius.circular(clint ? 16.0 : 0.0),
            bottomEnd: Radius.circular(clint ? 0.0 : 16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.message,
              style: TextStyleManager.font14Grey400.copyWith(
                color: clint
                    ? ColorManager.originalWhite
                    : ColorManager.originalBlack,
              ),
            ),
            verticalSpace(4.0),
            Text(
              "${message.createdAt == null ? ' ' : message.createdAt!.split("T")[1].substring(0, 5)} · Read",
              style: TextStyleManager.font10Grey400.copyWith(
                color: clint
                    ? ColorManager.originalWhite
                    : ColorManager.originalBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
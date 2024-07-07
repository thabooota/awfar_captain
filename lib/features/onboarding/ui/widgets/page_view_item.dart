import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../models/page_view_item_model.dart';

class PageViewItem extends StatelessWidget {
  final PageViewItemModel item;

  const PageViewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          item.image,
          width: 250.0.w,
          height: 250.0.h,
        ),
        verticalSpace(110.0.h),
        Text(
          item.title,
          style: TextStyleManager.font30Black600,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

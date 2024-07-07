import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';

class AppTextButton extends StatelessWidget {
  final String appText;
  final void Function()? onTap;

  const AppTextButton({
    super.key,
    required this.appText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          backgroundColor: ColorManager.green,
          minimumSize: Size(double.maxFinite, 45.0.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(
        appText,
        style: TextStyleManager.font25White600,
      ),
    );
  }
}

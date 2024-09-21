import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';
import '../theming/text_style_manager.dart';

class AppTextButton extends StatelessWidget {
  final String appText;
  final Size? minimumSize;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;

  const AppTextButton({
    super.key,
    required this.appText,
    required this.onTap,
    this.minimumSize,
    this.textStyle, this.backgroundColor, this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor?? ColorManager.green,
        minimumSize: minimumSize ?? Size(double.maxFinite, 45.0.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?? 8),
        ),
      ),
      child: Text(
        appText,
        style: textStyle ?? TextStyleManager.font25White600,
      ),
    );
  }
}

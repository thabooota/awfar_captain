import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/text_style_manager.dart';

class TechnicalSupportContainer extends StatelessWidget {
  final Color color;
  final String text;
  const TechnicalSupportContainer({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: TextStyleManager.font17White500,
      ),
    );
  }
}

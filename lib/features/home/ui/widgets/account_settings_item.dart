import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingsItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const AccountSettingsItem({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(text, style: TextStyleManager.font17TextColor400,),
          IconButton(
              onPressed: onPressed, icon: const Icon(Icons.arrow_forward_ios),),
        ],
      ),
    );
  }
}

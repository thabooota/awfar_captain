import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class CustomCardAuth extends StatelessWidget {
  final Widget widget;
  final String text;
  const CustomCardAuth({super.key, required this.widget, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManager.lighterGrey,
                blurRadius: 8,
                blurStyle: BlurStyle.normal,
                spreadRadius: 10,
                offset: Offset( 0, -5,)
            )
          ],
      ),
      child: Card(
        color: ColorManager.lightGrey,
        elevation: 0.0,
        shadowColor: ColorManager.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Text(
              text,
              style: TextStyleManager.font30Black600,
            ),
            const SizedBox(
              height: 160.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              decoration: const BoxDecoration(
                color: ColorManager.originalWhite,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              child: widget,
            )
          ],
        ),
      ),
    );
  }
}

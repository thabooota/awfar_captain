import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class AddDecumentsWidget extends StatelessWidget {
 final String text;
  const AddDecumentsWidget({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(text, style: TextStyleManager.font13Black600,),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: GradientBoxBorder(

                  gradient: LinearGradient(colors: ColorManager.bordersColor)),
            ),
            child: Image.asset('assets/icons/ic_upload.png'),
          ),
        ],
      ),
    );
  }
}

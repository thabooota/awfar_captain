import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class CustomTextForm extends StatelessWidget {
  final FormFieldValidator validator;
  final TextInputType inputType;
  final bool obscureText;
  final Widget ?suffixIcon;
  final String text;
  const CustomTextForm({super.key, required this.validator, required this.obscureText, this.suffixIcon, required this.text, required this.inputType});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText,
      validator: validator,
      keyboardType: inputType,
      decoration: InputDecoration(

        suffixIcon: suffixIcon,
          labelText: text,
          labelStyle: TextStyleManager.font20Gray400,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorManager.green,
                width: 1.0,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorManager.red,
                width: 1.0,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorManager.lighterGrey,
                width: 1.0,
              )
          )
      ),
    );
  }
}


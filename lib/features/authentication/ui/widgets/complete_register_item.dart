import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import 'custom_text_form.dart';

class CompleteRegisterItem extends StatelessWidget {
  final String label, hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool hidePassword;
  final Widget? suffixIcon;

  const CompleteRegisterItem({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.inputType,
    required this.hidePassword,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleManager.font13Black600,
        ),
        verticalSpace(12.0),
        CustomTextForm(
          inputType: inputType,
          text: label,
          suffixIcon: suffixIcon,
          obscureText: hidePassword,
          validator: (value) {
            return value;
          },
        ),
      ],
    );
  }
}

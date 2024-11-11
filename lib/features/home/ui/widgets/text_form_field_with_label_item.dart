import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../authentication/ui/widgets/custom_text_form.dart';

class TextFormFieldWithLabelItem extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool hidePassword;
  final Widget? suffixIcon;
  final FormFieldValidator validator;

  const TextFormFieldWithLabelItem({
    super.key,
    required this.label,
    required this.validator,
    required this.controller,
    required this.inputType,
    required this.hidePassword,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyleManager.font13Black600,
        ),
        verticalSpace(12.0),
        CustomTextForm(
          controller: controller,
          inputType: inputType,
          text: label,
          obscureText: hidePassword,
          suffixIcon: suffixIcon,
          validator: validator,
        ),
      ],
    );
  }
}

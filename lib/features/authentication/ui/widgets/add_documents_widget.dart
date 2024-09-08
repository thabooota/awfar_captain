import 'dart:io';

import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class AddDocumentsWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final File? file;

  const AddDocumentsWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyleManager.font13Black600,
            ),
          ),
          file != null
              ? Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 26,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: ColorManager.bordersColor),
                      ),
                    ),
                    child: Text(
                      file!.path.split("/")[file!.path.split("/").length -1],
                      style: TextStyleManager.font13Black50OP600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              )
              : GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 26),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: ColorManager.bordersColor)),
                    ),
                    child: Image.asset('assets/icons/ic_upload.png'),
                  ),
                ),
        ],
      ),
    );
  }
}

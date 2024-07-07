import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/utils/variable_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
*/

class TextStyleManager {
  static TextStyle font30Black600 = TextStyle(
    fontFamily: VariableManager.fontFamily,
    color: ColorManager.originalBlack,
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font25White600 = TextStyle(
    fontFamily: VariableManager.fontFamily,
    color: ColorManager.originalWhite,
    fontSize: 25.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font20Gray400 = TextStyle(
    fontFamily: VariableManager.fontFamily,
    color: ColorManager.darkGrey,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font17black400 = TextStyle(
    fontFamily: VariableManager.fontFamily,
    color: ColorManager.originalBlack,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font17blackBold = TextStyle(
    fontFamily: VariableManager.fontFamily,
    color: ColorManager.originalBlack,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font17TextColor600 = TextStyle(
    fontFamily: VariableManager.fontFamily,
    color: ColorManager.textColor,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
}

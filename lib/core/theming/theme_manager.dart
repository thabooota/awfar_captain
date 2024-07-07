import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

class ThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    scaffoldBackgroundColor: ColorManager.originalWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.originalWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: ColorManager.originalWhite,
        systemNavigationBarColor: ColorManager.originalWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      shape: Border(
          bottom: BorderSide(
              color: Color(0x4D000000),
              width: 0.5
          )
      ),
    ),
  );

  static ThemeData getDarkTheme() => ThemeData();
}

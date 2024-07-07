
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routing/app_router.dart';
import '../core/theming/theme_manager.dart';

class AwfarCaptainApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const AwfarCaptainApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize: const Size(375, 812));
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awfar-Captain',
        initialRoute: initialRoute,
        theme: ThemeManager.getLightTheme(),
        darkTheme: ThemeManager.getDarkTheme(),
        themeMode: ThemeMode.light,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

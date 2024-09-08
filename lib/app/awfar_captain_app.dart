
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routing/app_router.dart';
import '../core/theming/theme_manager.dart';
import '../core/utils/internet_connection.dart';

class AwfarCaptainApp extends StatefulWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const AwfarCaptainApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  @override
  State<AwfarCaptainApp> createState() => _AwfarCaptainAppState();
}

class _AwfarCaptainAppState extends State<AwfarCaptainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lostConnection();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      splitScreenMode: true,
      child: StreamBuilder<List<ConnectivityResult>>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
        if (snapshot.data == ConnectivityResult.none) {
        return const LostConnection();
      } else {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Awfar-Captain',
          initialRoute: widget.initialRoute,
          theme: ThemeManager.getLightTheme(),
          darkTheme: ThemeManager.getDarkTheme(),
          themeMode: ThemeMode.light,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          onGenerateRoute: widget.appRouter.generateRoute,
        );
      }
    }
      ),
    );
  }

}

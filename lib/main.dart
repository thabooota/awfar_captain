import 'dart:async';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/lang/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/awfar_captain_app.dart';
import 'core/app_cubit/bloc_observer.dart';
import 'core/di/dependency_injection.dart';
import 'core/networking/local/prefs_manager.dart';
import 'core/networking/local/shared_preferences.dart';
import 'core/routing/app_router.dart';
import 'core/theming/color_manager.dart';
import 'core/utils/method_manager.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = MyBlocObserver();
      SharedPreferencesManager.init();
      await ScreenUtil.ensureScreenSize();
      await EasyLocalization.ensureInitialized();
      await setupGetIt();
      await Hive.initFlutter();

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.originalWhite,
          systemNavigationBarColor: ColorManager.originalWhite,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      String initialRoute = Routes.onboarding;
      bool? isOnboarding =
          SharedPreferencesManager.getData(key: PrefsManager.onboarding);
      String? token = SharedPreferencesManager.getData(key: PrefsManager.token);

      if (isOnboarding != null) {
        if (token != null) {
          initialRoute = Routes.home;
        } else {
          initialRoute = Routes.login;
        }
      }

      Locale locale = MethodsManager.getLocate();
      runApp(EasyLocalization(
        path: 'assets/locales',
        supportedLocales: const[
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale:locale,
        startLocale: locale,
        assetLoader: const CodegenLoader(),
        child: AwfarCaptainApp(
          appRouter: AppRouter(),
          initialRoute: initialRoute,
        ),
      ));
    },
    (error, stackTrace) async {
      debugPrint("Global Error: $error");
      debugPrint("Global StackTrace: $stackTrace");
    },
  );
}

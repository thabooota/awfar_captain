import 'dart:async';
import 'package:awfar_captain/core/routing/routes.dart';
import 'package:awfar_captain/core/utils/local_notifications_service.dart';
import 'package:awfar_captain/core/utils/push_notifications_service.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = MyBlocObserver();

      SharedPreferencesManager.init();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await ScreenUtil.ensureScreenSize();

      await EasyLocalization.ensureInitialized();
      await LocalNotificationsService.init();
      await setupGetIt();

      await Hive.initFlutter();
      PushNotificationsService.init();
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
      bool ?isVerifyCode = SharedPreferencesManager.getData(key: PrefsManager.verifyCode);
      bool ?isCompleteAddDetails = SharedPreferencesManager.getData(key: PrefsManager.completeAddDetails);
      bool ?isCompleteAddDecuments = SharedPreferencesManager.getData(key: PrefsManager.completeAddDecuments);
      String? token = SharedPreferencesManager.getData(
        key: PrefsManager.token,
      );

      if (isOnboarding != null) {
        if (token != null&& isVerifyCode != null && isCompleteAddDetails != null && isCompleteAddDecuments != null) {
          initialRoute = Routes.home;
        }
        if (token != null && isVerifyCode != null && isCompleteAddDetails != null && isCompleteAddDecuments == null) {
          initialRoute = Routes.addDecuments;
        }
        if (token != null && isVerifyCode != null  && isCompleteAddDetails == null && isCompleteAddDecuments == null) {
            initialRoute = Routes.completeRegister;
          }
        if (token != null  && isVerifyCode == null  && isCompleteAddDetails == null && isCompleteAddDecuments == null) {
          initialRoute = Routes.register;
        }
      }

      Locale locale = MethodsManager.getLocate();

      runApp(EasyLocalization(
        path: 'assets/locales',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: locale,
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

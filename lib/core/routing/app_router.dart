import 'package:awfar_captain/features/authentication/ui/add_decuments_screen.dart';
import 'package:awfar_captain/features/authentication/ui/verify_otp_screen.dart';
import 'package:awfar_captain/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/ui/login_screen.dart';
import '../../features/authentication/ui/register_screen.dart';
import '../../features/authentication/ui/complete_register_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import 'animation_route.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Welcome
      case Routes.onboarding:
        return AnimationRoute(page: const OnboardingScreen());

      // Authentication
      case Routes.login:
        return AnimationRoute(page: const LoginScreen());
      case Routes.register:
        return AnimationRoute(page: const RegisterScreen());
      case Routes.otpVerifyAccount:
        return AnimationRoute(page: const VerifyOTPScreen());
      case Routes.completeRegister:
        return AnimationRoute(page: const CompleteRegisterScreen());
      case Routes.addDecuments:
        return AnimationRoute(page: const AddDecumentsScreen());
      // Home
      case Routes.home:
        return AnimationRoute(page: const HomeScreen());

      // undefined
      default:
        return unDefinitionRoute(settings);
    }
  }

  AnimationRoute unDefinitionRoute(RouteSettings settings) => AnimationRoute(
        page: Scaffold(
          body: Center(
            child: Text('no route defined for this page ${settings.name}'),
          ),
        ),
      );
}

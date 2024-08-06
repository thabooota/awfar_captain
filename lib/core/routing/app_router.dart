import 'package:awfar_captain/core/di/dependency_injection.dart';
import 'package:awfar_captain/features/authentication/ui/add_decuments_screen.dart';
import 'package:awfar_captain/features/authentication/ui/verify_otp_forget_password.dart';
import 'package:awfar_captain/features/authentication/ui/verify_otp_register.dart';
import 'package:awfar_captain/features/chat/ui/chat_screen_view.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/ui/change_password_done_screen.dart';
import '../../features/authentication/ui/complete_forget_password_screen.dart';
import '../../features/authentication/ui/forget_password_screen.dart';
import '../../features/authentication/ui/login_screen.dart';
import '../../features/authentication/ui/register_screen.dart';
import '../../features/authentication/ui/complete_register_screen.dart';
import '../../features/captain_gate/ui/captain_gate_screen.dart';
import '../../features/home/ui/account_settings.dart';
import '../../features/home/ui/finish_trip_screen.dart';
import '../../features/home/ui/rating_screen.dart';
import '../../features/home/ui/technical_support.dart';
import '../../features/notification/ui/notification_screen.dart';
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
      case Routes.otpVerifyAccountRegister:
        return AnimationRoute(page: const VerifyOtpRegister());
      case Routes.completeRegister:
        return AnimationRoute(page: const CompleteRegisterScreen());
      case Routes.addDecuments:
        return AnimationRoute(page: const AddDecumentsScreen());
      case Routes.completeForgetPassword:
        return AnimationRoute(page: const CompleteForgetPasswordScreen());
      case Routes.changePasswordDone:
        return AnimationRoute(page: const ChangePasswordDoneScreen());
      case Routes.forgetPassword:
        return AnimationRoute(page: const ForgetPasswordScreen());
      case Routes.otpVerifyAccountForgetPassword:
        return AnimationRoute(page: const VerifyOtpForgetPassword());

      // Home
      case Routes.home:
        return AnimationRoute(page: BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>()..bottomSheets(),
            child: const HomeScreen()));
      case Routes.captainGate:
        return AnimationRoute(page: const CaptainGateScreen());
      case Routes.notification:
        return AnimationRoute(page: const NotificationScreen());
      case Routes.rating:
        return AnimationRoute(page: const RatingScreen());
      case Routes.finishTrip:
        return AnimationRoute(page: const FinishTripScreen());
      case Routes.chat:
        return AnimationRoute(page: const ChatScreenView());
      case Routes.technicalSupport:
        return AnimationRoute(page: const TechnicalSupport());
      case Routes.accountSettings:
        return AnimationRoute(page: const AccountSettings());
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

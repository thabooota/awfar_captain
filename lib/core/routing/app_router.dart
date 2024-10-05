import 'package:awfar_captain/core/di/dependency_injection.dart';
import 'package:awfar_captain/features/authentication/logic/login/login_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/ui/add_documents_screen.dart';
import 'package:awfar_captain/features/authentication/ui/verify_otp_forget_password.dart';
import 'package:awfar_captain/features/authentication/ui/verify_otp_register.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_cubit.dart';
import 'package:awfar_captain/features/chat/ui/chat_screen_view.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:awfar_captain/features/home/ui/edit_account_screen.dart';
import 'package:awfar_captain/features/home/ui/home_screen.dart';
import 'package:awfar_captain/features/home/ui/my_trip_screen.dart';
import 'package:awfar_captain/features/home/ui/report_my_trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/logic/forget_password/forget_password_cubit.dart';
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
import '../../features/home/ui/withdraw_balance.dart';
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
        return AnimationRoute(
            page: BlocProvider<LoginCubit>(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen()));
      case Routes.register:
        return AnimationRoute(
            page: BlocProvider<RegisterCubit>(
                create: (context) => getIt<RegisterCubit>(),
                child: const RegisterScreen()));
      case Routes.otpVerifyAccountRegister:
        return AnimationRoute(
            page: BlocProvider.value(
                value: getIt<RegisterCubit>(),
                child: VerifyOtpRegister(
                  phone: settings.arguments as String,
                )));
      case Routes.completeRegister:
        return AnimationRoute(
            page: BlocProvider.value(
                value: getIt<RegisterCubit>(),
                child: const CompleteRegisterScreen()));
      case Routes.addDecuments:
        return AnimationRoute(
            page: BlocProvider.value(
                value: getIt<RegisterCubit>(),
                child: const AddDocumentsScreen()));
      case Routes.completeForgetPassword:
        return AnimationRoute(
            page: BlocProvider<ForgotPasswordCubit>(
                create: (context) => getIt<ForgotPasswordCubit>(),
                child: CompleteForgetPasswordScreen(
                  phone: settings.arguments as String,
                )));
      case Routes.changePasswordDone:
        return AnimationRoute(page: const ChangePasswordDoneScreen());
      case Routes.forgetPassword:
        return AnimationRoute(
            page: BlocProvider<ForgotPasswordCubit>(
                create: (context) => getIt<ForgotPasswordCubit>(),
                child: const ForgetPasswordScreen()));
      case Routes.otpVerifyAccountForgetPassword:
        return AnimationRoute(
            page: BlocProvider.value(
                value: getIt<ForgotPasswordCubit>(),
                child: VerifyOtpForgetPassword(
                    phone: settings.arguments as String)));

      // Home
      case Routes.home:
        return AnimationRoute(
            page: MultiBlocProvider(
    providers: [
                BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()..bottomSheets()),
                 BlocProvider<CaptainGateCubit> (create: (context) => getIt<CaptainGateCubit>()..emitGetProfileStates(),)
                ],
                child: const HomeScreen()));
      case Routes.captainGate:
        return AnimationRoute(
            page: BlocProvider.value(
                value: getIt<CaptainGateCubit>()..emitGetMyBalance()..emitGetAllTrips(),
                 child:
                 const CaptainGateScreen()));
        case Routes.reportMyTrips:
        return AnimationRoute(page: const ReportMyTrips());
      case Routes.notification:
        return AnimationRoute(page: const NotificationScreen());
        case Routes.myRides:
        return AnimationRoute(page: const MyTripScreen());
      case Routes.rating:
        return AnimationRoute(page: const RatingScreen());
      case Routes.finishTrip:
        return AnimationRoute(page: const FinishTripScreen());
      case Routes.chat:
        return AnimationRoute(page: const ChatScreenView());
      case Routes.technicalSupport:
        return AnimationRoute(page: const TechnicalSupport());
      case Routes.accountSettings:
        return AnimationRoute(
            page: BlocProvider.value(
                value: getIt<CaptainGateCubit>(), child: const AccountSettings()));
      case Routes.editAccount:
        return AnimationRoute(
            page: BlocProvider(
                create:(context) =>  getIt<CaptainGateCubit>()..emitGetMyBalance(), child: const EditAccountScreen()));
      case Routes.withdrawBalance:
        return AnimationRoute(page: const WithdrawBalance());
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

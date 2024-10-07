import 'package:awfar_captain/core/networking/remote/services/captain_gate_api_services.dart';
import 'package:awfar_captain/core/networking/remote/services/home_api_service.dart';
import 'package:awfar_captain/features/captain_gate/data/repo/repo.dart';
import 'package:awfar_captain/features/home/data/repo/home_repo.dart';
import 'package:awfar_captain/features/home/logic/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/authentication/data/repo/forgot_password_repo.dart';
import '../../features/authentication/data/repo/login_repo.dart';
import '../../features/authentication/data/repo/register_repo.dart';
import '../../features/authentication/logic/forget_password/forget_password_cubit.dart';
import '../../features/authentication/logic/login/login_cubit.dart';
import '../../features/authentication/logic/register/register_cubit.dart';
import '../../features/captain_gate/logic/captain_gate_cubit.dart';
import '../../features/home/data/repo/routes_rep.dart';
import '../app_cubit/app_cubit.dart';
import '../networking/remote/dio_factory.dart';
import '../networking/remote/services/auth_api_service.dart';
import '../networking/remote/services/routes_api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // app
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());

  // dio
  Dio dio = DioFactory.getDio();

  // services
  getIt.registerLazySingleton<AuthApiService>(
          () => AuthApiService(dio));
  getIt.registerLazySingleton<HomeApiService>(
          () => HomeApiService(dio));
  getIt.registerLazySingleton<CaptainApiServices>(
          () => CaptainApiServices(dio));
  getIt.registerLazySingleton<RoutesApiService>(
      () => RoutesApiService(dio));
  // repos
  getIt.registerLazySingleton<RegisterRepo>(
          () => RegisterRepo(getIt<AuthApiService>()));

  getIt.registerLazySingleton<LoginRepo>(
          () => LoginRepo(getIt<AuthApiService>()));

  getIt.registerLazySingleton<ForgotPasswordRepo>(
          () => ForgotPasswordRepo(getIt<AuthApiService>()));

  getIt.registerLazySingleton<HomeRepo> (
          () => HomeRepo(getIt<HomeApiService>()));

  getIt.registerLazySingleton<CaptainGateRepo>(
          () => CaptainGateRepo(getIt<CaptainApiServices>()));

  getIt.registerLazySingleton<RoutesRepo>(
          () => RoutesRepo(getIt<RoutesApiService>()));
  // cubits
  getIt.registerFactory<RegisterCubit>(
          () => RegisterCubit(getIt<RegisterRepo>()));
  getIt.registerFactory<LoginCubit>(
          () => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<ForgotPasswordCubit>(
          () => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()));
  getIt.registerFactory<HomeCubit>(
          () => HomeCubit(
              getIt<HomeRepo>(),
            getIt<RoutesRepo>(),
              ));

  getIt.registerFactory<CaptainGateCubit>(
          () => CaptainGateCubit(getIt<CaptainGateRepo>(),));
}

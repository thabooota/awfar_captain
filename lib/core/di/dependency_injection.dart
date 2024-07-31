import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/logic/home_cubit.dart';
import '../app_cubit/app_cubit.dart';
import '../networking/remote/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // app
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());

  // dio && ApiService
  Dio dio = DioFactory.getDio();

  //home
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../di/dependency_injection.dart';
import '../../helpers/navigation_service.dart';
import '../../helpers/snackbar_service.dart';
import '../../routing/routes.dart';
import '../local/prefs_manager.dart';
import '../local/shared_preferences.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 45);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };
      addDioInterceptor();
      handleUnauthorized();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }


  static void handleUnauthorized() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            SharedPreferencesManager.deleteSecuredString(key: PrefsManager.token).then(
                  (_) => getIt.reset().then(
                    (_) {
                  setupGetIt().then(
                        (value) {
                      SnackBarService.showSnackBar(
                          error.response?.data["message"]);

                      return NavigationService.navigateToAndRemoveAll(
                          Routes.login);
                    },
                  );
                },
              ),
            );
          }
          return handler.next(error);
        },
      ),
    );
  }
}

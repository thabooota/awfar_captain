import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/networking/remote/services/home_api_service.dart';
import 'package:awfar_captain/features/home/data/models/response/get_trip_response.dart';
import '../../../../core/networking/remote/api_result.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  final String apiKey = 'AIzaSyB51Rkafh8v_Vi5qQZAAs04x23gEGcMHxE';
  HomeRepo(this._homeApiService);

  Future<ApiResult<GetTripResponse>> getTrip({required String token}) async {
    try {
      final response = await _homeApiService.getTrip(token: 'Bearer $token');
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

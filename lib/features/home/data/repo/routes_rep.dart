import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';

import '../../../../core/networking/remote/api_result.dart';
import '../../../../core/networking/remote/services/routes_api_service.dart';
import '../models/requests/get_routes_request_body.dart';
import '../models/response/get_routes_response.dart';

class RoutesRepo {
  final RoutesApiService _routesApiService;
  final String apiKey = 'AIzaSyB51Rkafh8v_Vi5qQZAAs04x23gEGcMHxE';

  RoutesRepo(this._routesApiService);

  Future<ApiResult<GetRoutesResponse>> getRoutes({
    required GetRoutesRequestBody getRoutesRequestBody,
  }) async {
    try {
      final response = await _routesApiService.getRoutes(
        apiKey: apiKey,
        contentType: "application/json",
        xGoogleFieldMask:
        "routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline",
        getRoutesRequestBody: getRoutesRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
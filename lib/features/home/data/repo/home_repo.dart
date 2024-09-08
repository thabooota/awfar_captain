import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/networking/remote/services/home_api_service.dart';
import 'package:awfar_captain/features/home/data/models/requests/upload_profile_request_body.dart';
import 'package:awfar_captain/features/home/data/models/response/get_profile_response.dart';
import 'package:awfar_captain/features/home/data/models/response/update_profile_response.dart';

import '../../../../core/networking/remote/api_result.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<GetProfileResponse>> getProfile ({
    required String token,
  }) async {
    try {
      final response = await _homeApiService.getProfile(token: 'Bearer $token');
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UpdateProfileResponse>> updateProfile({required String token, required UpdateProfileRequestBody updateRequestBody}) async {
    try {
      final response = await _homeApiService.updateProfile(token: 'Bearer $token', body: updateRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
}
}

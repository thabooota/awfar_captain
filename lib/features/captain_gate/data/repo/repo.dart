import 'package:awfar_captain/core/networking/remote/api_result.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_all_trips_response.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_my_balance_response.dart';

import '../../../../core/networking/remote/api_error_handler.dart';
import '../../../../core/networking/remote/services/captain_gate_api_services.dart';
import '../../../home/data/models/requests/upload_profile_request_body.dart';
import '../../../home/data/models/response/get_profile_response.dart';
import '../../../home/data/models/response/update_profile_response.dart';

class CaptainGateRepo {
  final CaptainApiServices _captainApiServices;
  CaptainGateRepo(this._captainApiServices);

  Future<ApiResult<GetMyBalanceResponse>> getMyBalance ({
    required String token,

}) async {
    try {
      final response = await _captainApiServices.getMyBalance(token: 'Bearer $token');
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<GetProfileResponse>> getProfile ({
    required String token,
  }) async {
    try {
      final response = await _captainApiServices.getProfile(token: 'Bearer $token');
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UpdateProfileResponse>> updateProfile({
    required String token,
    required UpdateProfileRequestBody updateRequestBody,
  }) async {
    try {
      final response = await _captainApiServices.updateProfile(token: 'Bearer $token', body: updateRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetAllTripsResponse>> getAllTrips({required String token}) async {
    try {
      final response = await _captainApiServices.getAllTrips(token: 'Bearer $token');
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
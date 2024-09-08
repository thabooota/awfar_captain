import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/networking/remote/services/auth_api_service.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/upload_file_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/remote/api_result.dart';
import '../models/requests/add_details_request_body.dart';
import '../models/requests/register_request_body.dart';
import '../models/requests/verify_phone_request_body.dart';
import '../models/responses/add_details_response.dart';
import '../models/responses/register_response.dart';
import '../models/responses/verify_phone_response.dart';

class RegisterRepo {
  final AuthApiService _authApiService;

  RegisterRepo(this._authApiService);

  Future<ApiResult<RegisterResponse>> register({
    required RegisterRequestBody registerRequestBody,
  }) async {
    try {
      final registerResponse = await _authApiService.register(
        requiredRegisterRequest: registerRequestBody,
      );

      return ApiResult.success(registerResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
    required VerifyPhoneRequestBody verifyPhoneRequestBody,
  }) async {
    try {
      final verifyPhoneResponse = await _authApiService.verifyPhone(
        verifyPhoneRequestBody: verifyPhoneRequestBody,
      );

      return ApiResult.success(verifyPhoneResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddDetailsResponse>> addDetails({
    required String token,
    required AddDetailsRequestBody addDetailsRequestBody,
  }) async {
    try {
      final addDetailsResponse = await _authApiService.addDetails(
        token: 'Bearer $token',
        addDetailsRequestBody: addDetailsRequestBody,
      );
      return ApiResult.success(addDetailsResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UploadFileResponse>> uploadFiles({
    required String token,
    required FormData files,
  }) async {
    try {
      final uploadFileResponse = await _authApiService.uploadFiles(
        token: 'Bearer $token',
        files: files,
      );
      return ApiResult.success(uploadFileResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/networking/remote/services/auth_api_service.dart';
import '../../../../core/networking/remote/api_result.dart';
import '../models/requests/check_code_request_body.dart';
import '../models/requests/forgot_password_request_body.dart';
import '../models/requests/reset_password_request_body.dart';
import '../models/responses/check_code_response.dart';
import '../models/responses/forgot_password_response.dart';
import '../models/responses/reset_password_response.dart';

class ForgotPasswordRepo {
  final AuthApiService _authApiService;

  ForgotPasswordRepo(this._authApiService);

  Future<ApiResult<ForgotPasswordResponse>> forgotPassword({
    required ForgotPasswordRequestBody forgotPasswordRequestBody,
  }) async {
    try {
      final forgotPasswordResponse =
          await _authApiService.forgotPassword(
        forgotPasswordRequestBody: forgotPasswordRequestBody,
      );

      return ApiResult.success(forgotPasswordResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CheckCodeResponse>> checkCode({
    required CheckCodeRequestBody checkCodeRequestBody,
  }) async {
    try {
      final checkCodeResponse = await _authApiService.checkCode(
        checkCodeRequestBody: checkCodeRequestBody,
      );

      return ApiResult.success(checkCodeResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResetPasswordResponse>> resetPassword({
    required ResetPasswordRequestBody resetPasswordRequestBody,
  }) async {
    try {
      final resetPasswordResponse =
          await _authApiService.resetPassword(
        resetPasswordRequestBody: resetPasswordRequestBody,
      );

      return ApiResult.success(resetPasswordResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

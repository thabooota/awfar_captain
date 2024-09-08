import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/networking/remote/services/auth_api_service.dart';
import 'package:awfar_captain/features/authentication/data/models/requests/login_request_body.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/login_response.dart';
import '../../../../core/networking/remote/api_result.dart';

class LoginRepo {
  final AuthApiService _apiService;
  const LoginRepo(this._apiService);


  Future<ApiResult<LoginResponse>> login (
      LoginRequestBody loginRequestBody
      ) async {
    try {
      final response = await _apiService.loginUser(loginRequestBody: loginRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      print(error.toString());
      return ApiResult.failure(ErrorHandler.handle(error));

    }
  }
}
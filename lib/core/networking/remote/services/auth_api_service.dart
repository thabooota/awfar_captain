import 'package:awfar_captain/core/networking/remote/api_constants.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/add_details_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/login_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/register_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/upload_file_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/verify_phone_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../features/authentication/data/models/requests/add_details_request_body.dart';
import '../../../../features/authentication/data/models/requests/check_code_request_body.dart';
import '../../../../features/authentication/data/models/requests/forgot_password_request_body.dart';
import '../../../../features/authentication/data/models/requests/login_request_body.dart';
import '../../../../features/authentication/data/models/requests/register_request_body.dart';
import '../../../../features/authentication/data/models/requests/reset_password_request_body.dart';
import '../../../../features/authentication/data/models/requests/verify_phone_request_body.dart';
import '../../../../features/authentication/data/models/responses/check_code_response.dart';
import '../../../../features/authentication/data/models/responses/forgot_password_response.dart';
import '../../../../features/authentication/data/models/responses/reset_password_response.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  // register service
  @POST(ApiConstants.registerEndPoint)
  Future<RegisterResponse> register({
    @Body() required RegisterRequestBody requiredRegisterRequest,
  });

  @POST(ApiConstants.verifyPhoneEndPoint)
  Future<VerifyPhoneResponse> verifyPhone({
    @Body() required VerifyPhoneRequestBody verifyPhoneRequestBody,
  });

  @POST(ApiConstants.addDetailsEndPoint)
  Future<AddDetailsResponse> addDetails({
    @Header('Authorization') required String token,
    @Body() required AddDetailsRequestBody addDetailsRequestBody,
  });

  @POST(ApiConstants.uploadFilesEndPoint)
  Future<UploadFileResponse> uploadFiles(
      {@Header('Authorization') required String token,
      @Body() required FormData files});

  // login service
  @POST(ApiConstants.loginEndPoint)
  Future<LoginResponse> loginUser({
    @Body() required LoginRequestBody loginRequestBody,
  });

  // forget password service
  @POST(ApiConstants.forgotPasswordEndPoint)
  Future<ForgotPasswordResponse> forgotPassword({
    @Body() required ForgotPasswordRequestBody forgotPasswordRequestBody,
  });

  @POST(ApiConstants.checkCodeEndPoint)
  Future<CheckCodeResponse> checkCode({
    @Body() required CheckCodeRequestBody checkCodeRequestBody,
  });

  @POST(ApiConstants.resetPasswordEndPoint)
  Future<ResetPasswordResponse> resetPassword({
    @Body() required ResetPasswordRequestBody resetPasswordRequestBody,
  });
}

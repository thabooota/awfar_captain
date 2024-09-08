import 'package:awfar_captain/core/networking/remote/api_constants.dart';
import 'package:awfar_captain/features/home/data/models/response/update_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../features/home/data/models/requests/upload_profile_request_body.dart';
import '../../../../features/home/data/models/response/get_profile_response.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(ApiConstants.getProfile)
  Future<GetProfileResponse> getProfile({
    @Header('Authorization') required String token,
  });

  @POST(ApiConstants.updateProfileEndPoint)
  Future<UpdateProfileResponse> updateProfile({
    @Header('Authorization') required String token,
    @Body() required UpdateProfileRequestBody body,
  });
}

import 'package:awfar_captain/core/networking/remote/api_constants.dart';
import 'package:awfar_captain/features/captain_gate/data/model/requests/get_report_request_body.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_all_trips_response.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_my_balance_response.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_report_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../features/home/data/models/requests/upload_profile_request_body.dart';
import '../../../../features/home/data/models/response/get_profile_response.dart';
import '../../../../features/home/data/models/response/update_profile_response.dart';
part 'captain_gate_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class CaptainApiServices {
  factory CaptainApiServices(Dio dio, {String baseUrl}) = _CaptainApiServices;

  // get driver balance
  @GET(ApiConstants.getMyBalance)
  Future<GetMyBalanceResponse> getMyBalance({
    @Header('Authorization') required String token,
  });
  @GET(ApiConstants.getProfile)
  Future<GetProfileResponse> getProfile({
    @Header('Authorization') required String token,
  });

  @POST(ApiConstants.updateProfileEndPoint)
  Future<UpdateProfileResponse> updateProfile({
    @Header('Authorization') required String token,
    @Body() required UpdateProfileRequestBody body,
  });

  @GET(ApiConstants.getMyTrip)
  Future<GetTripsResponse> getAllTrips({
    @Header('Authorization') required String token,
  });
  @POST(ApiConstants.getReport)
  Future<GetReportResponse> getReport({
    @Header('Authorization') required String token,
    @Body() required GetReportRequestBody getReportRequestBody,
  });
}

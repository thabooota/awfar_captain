import 'package:awfar_captain/core/networking/remote/api_constants.dart';
import 'package:awfar_captain/features/home/data/models/requests/rate_client_request_body.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_my_trip_response.dart';
import 'package:awfar_captain/features/home/data/models/response/get_trip_response.dart';
import 'package:awfar_captain/features/home/data/models/response/update_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../features/chat/data/models/request/send_message_request_body.dart';
import '../../../../features/home/data/models/requests/upload_profile_request_body.dart';
import '../../../../features/home/data/models/response/get_profile_response.dart';
import '../../../../features/home/data/models/response/massage_response.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @POST(ApiConstants.rateClient)
  Future<MassageResponse> rateClient({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
    @Path('driverId') required String driverId,
    @Body() required RateClientRequestBody rateClientRequestBody,
  });

  @GET(ApiConstants.getTrip)
  Future<GetTripResponse> getTrip({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstants.getMyTrip)
  Future<GetMyTripResponse> getMyTrip({
    @Header('Authorization') required String token,
  });
@POST(ApiConstants.acceptTrip)
  Future<MassageResponse> acceptTrip({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
});

  @POST(ApiConstants.rejectedTrip)
  Future<MassageResponse> rejectedTrip({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
  });

  @POST(ApiConstants.sendMessage)
  Future<MassageResponse> sendMessage({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
    @Body() required SendMessageRequestBody body,
  });
}

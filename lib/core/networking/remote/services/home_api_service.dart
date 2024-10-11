import 'package:awfar_captain/core/networking/remote/api_constants.dart';
import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';
import 'package:awfar_captain/features/home/data/models/requests/accept_trip_request_body.dart';
import 'package:awfar_captain/features/home/data/models/requests/rate_client_request_body.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_my_trip_response.dart';
import 'package:awfar_captain/features/home/data/models/requests/store_driver_trip_request_body.dart';
import 'package:awfar_captain/features/home/data/models/requests/update_status_driver_request_body.dart';
import 'package:awfar_captain/features/home/data/models/response/get_trip_response.dart';
import 'package:awfar_captain/features/home/data/models/response/trip_accepted_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../features/chat/data/models/request/send_message_request_body.dart';
import '../../../../features/home/data/models/requests/get_routes_request_body.dart';
import '../../../../features/home/data/models/response/get_routes_response.dart';
import '../../../../features/home/data/models/response/massage_response.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @POST(ApiConstants.rateClient)
  Future<MassageResponse> rateClient({
    @Header('Authorization') required String token,
    @Path('tripId') required int tripId,
    @Path('driverId') required int driverId,
    @Body() required RateClientRequestBody rateClientRequestBody,
  });

  @GET(ApiConstants.getMyTrip)
  Future<GetMyTripResponse> getMyTrip({
    @Header('Authorization') required String token,
  });

  @POST(ApiConstants.acceptTrip)
  Future<TripAcceptedResponse> acceptTrip({
    @Body() required AcceptOrRejectedTripRequestBody acceptTripRequestBody,
  });

  @POST(ApiConstants.rejectedTrip)
  Future<MassageResponse> rejectedTrip({
    @Body() required AcceptOrRejectedTripRequestBody acceptTripRequestBody,
  });

  @POST(ApiConstants.sendMessage)
  Future<MassageResponse> sendMessage({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
    @Body() required SendMessageRequestBody body,
  });

  @POST(ApiConstants.storeDriverTrip)
  Future<MassageResponse> storeDriverTrip({
    @Header('Authorization') required String token,
    @Body() required StoreDriverTripRequestBody storeDriverTripRequestBody,
  });

  @POST(ApiConstants.changeDriverStatus)
  Future<MassageResponse> updateStatusDriver(
      {@Body()
      required UpdateStatusDriverRequestBody updateStatusDriverRequestBody});
  @POST(ApiConstants.tripCost)
  Future<MassageResponse> tripCost({
    @Body() required int charge,
    @Header('Authorization') required String token,
    @Path('tripId') required int tripId,
  });
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../features/home/data/models/requests/get_routes_request_body.dart';
import '../../../../features/home/data/models/response/get_routes_response.dart';
import '../api_constants.dart';


part 'routes_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.routesBaseUrl)
abstract class RoutesApiService {
  factory RoutesApiService(Dio dio, {String baseUrl}) = _RoutesApiService;

  @POST('/')
  Future<GetRoutesResponse> getRoutes({
    @Header('X-Goog-Api-Key') required String apiKey,
    @Header('Content-Type') required String contentType,
    @Header('X-Goog-FieldMask') required String xGoogleFieldMask,
    @Body() required GetRoutesRequestBody getRoutesRequestBody,
  });
}
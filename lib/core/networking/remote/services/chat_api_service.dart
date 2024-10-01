import 'package:awfar_captain/core/networking/remote/api_constants.dart';
import 'package:awfar_captain/features/chat/data/models/request/send_message_request_body.dart';
import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../features/home/data/models/response/massage_response.dart';
part 'chat_api_service.g.dart';

@RestApi(baseUrl:  ApiConstants.apiBaseURL)
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String baseUrl}) = _ChatApiService;

  @POST(ApiConstants.sendMessage)
  Future<MassageResponse> sendMessage({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
    @Body() required SendMessageRequestBody body,
  });

  @GET(ApiConstants.getMessage)
  Future<GetMessageResponse> getMessages({
    @Header('Authorization') required String token,
    @Path('tripId') required String tripId,
    @Path('clientId') required String driverId,
  });
}
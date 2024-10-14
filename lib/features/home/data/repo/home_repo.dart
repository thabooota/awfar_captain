import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/networking/remote/services/home_api_service.dart';
import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';
import 'package:awfar_captain/features/home/data/models/requests/accept_trip_request_body.dart';
import 'package:awfar_captain/features/home/data/models/requests/store_driver_trip_request_body.dart';
import 'package:awfar_captain/features/home/data/models/requests/update_status_driver_request_body.dart';
import 'package:awfar_captain/features/home/data/models/response/trip_accepted_response.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/networking/remote/api_result.dart';
import '../../../chat/data/models/request/get_message_request_body.dart';
import '../../../chat/data/models/request/send_message_request_body.dart';
import '../models/requests/rate_client_request_body.dart';
import '../models/response/massage_response.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);

  Future<ApiResult<MassageResponse>> storeDriverTrip(
      {required String token,
      required StoreDriverTripRequestBody storeDriverTripRequestBody}) async {
    try {
      final response = await _homeApiService.storeDriverTrip(
          token: 'Bearer $token',
          storeDriverTripRequestBody: storeDriverTripRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<TripAcceptedResponse>> acceptedTrip(
      {required AcceptOrRejectedTripRequestBody acceptTripRequestBody}) async {
    try {
      final response = await _homeApiService.acceptTrip(
          acceptTripRequestBody: acceptTripRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MassageResponse>> sendMessage({
    required SendMessageRequestBody sendMessageRequestBody
}) async {
    try {
      final response = await _homeApiService.sendMessage(
          body: sendMessageRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MassageResponse>> rejectedTrip(
      {required AcceptOrRejectedTripRequestBody rejectTripRequestBody}) async {
    try {
      final response = await _homeApiService.rejectedTrip(
          acceptTripRequestBody: rejectTripRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MassageResponse>> tripCost({
    required String token,
    required int tripId,
    required int charge,
  }) async {
    try {
      final response = await _homeApiService.tripCost(
          token: 'Bearer $token', tripId: tripId, charge: charge);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MassageResponse>> updateDriverStatus({
    required UpdateStatusDriverRequestBody updateStatusTripRequestBody,
  }) async {
    try {
      final response = await _homeApiService.updateStatusDriver(
          updateStatusDriverRequestBody: updateStatusTripRequestBody);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MassageResponse>> rateClient({
    required RateClientRequestBody rateClientRequestBody,
    required String token,
    required int tripId,
    required int driverId,
  }) async {
    try {
      final response = await _homeApiService.rateClient(
        rateClientRequestBody: rateClientRequestBody,
        token: 'Bearer $token',
        tripId: tripId,
        driverId: driverId,
      );
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetMessagesResponse>> getMessages({
    required GetMessagesRequestBody getMessagesRequestBody,
  }) async {
    try {
      final getMessagesResponse = await _homeApiService.getMessages(
        getMessagesRequestBody: getMessagesRequestBody,
      );
      return ApiResult.success(getMessagesResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

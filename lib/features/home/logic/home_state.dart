import 'package:awfar_captain/features/home/data/models/response/get_all_scheduled_trips_response.dart';
import 'package:awfar_captain/features/home/data/models/response/get_routes_response.dart';
import 'package:awfar_captain/features/home/data/models/response/massage_response.dart';
import 'package:awfar_captain/features/home/data/models/response/trip_accepted_response.dart';
import 'package:awfar_captain/features/notification/data/response/get_all_notifications_response.dart';

import '../../chat/data/models/response/get_meassage_response.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class ChangeBottomSheetState extends HomeStates {}

class ChangeConnectionState extends HomeStates {}

class GetRoutesLoadingState extends HomeStates {}

class GetCurrentLocationState extends HomeStates {}

class ChangeAppLangState extends HomeStates {}
class DisplayRouteState extends HomeStates {}

class GetRoutesSuccessState extends HomeStates {
  final GetRoutesResponse getRoutesResponse;
  GetRoutesSuccessState(this.getRoutesResponse);
}

class GetRoutesFailureState extends HomeStates {
  final String errorMessage;
  GetRoutesFailureState(this.errorMessage);
}

class StoreDriverTripLoadingState extends HomeStates {}

class StoreDriverTripSuccessState extends HomeStates {
  final MassageResponse massageResponse;
  StoreDriverTripSuccessState(this.massageResponse);
}

class StoreDriverTripFailureState extends HomeStates {
  final String errorMessage;
  StoreDriverTripFailureState(this.errorMessage);
}

class RestTripRequestState extends HomeStates {}

class AcceptedTripLoadingState extends HomeStates {}

class AcceptedTripSuccessState extends HomeStates {
  final TripAcceptedResponse tripAcceptedResponse;
  AcceptedTripSuccessState(this.tripAcceptedResponse);
}

class AcceptedTripFailureState extends HomeStates {
  final String errorMessage;
  AcceptedTripFailureState(this.errorMessage);
}

class RejectedTripLoadingState extends HomeStates {}

class RejectedTripSuccessState extends HomeStates {
  final MassageResponse massageResponse;
  RejectedTripSuccessState(this.massageResponse);
}

class RejectedTripFailureState extends HomeStates {
  final String errorMessage;
  RejectedTripFailureState(this.errorMessage);
}

class UpdateStatusTripLoadingState extends HomeStates {}

class UpdateStatusTripSuccessState extends HomeStates {
  final MassageResponse massageResponse;
  UpdateStatusTripSuccessState(this.massageResponse);
}

class UpdateStatusTripFailureState extends HomeStates {
  final String errorMessage;
  UpdateStatusTripFailureState(this.errorMessage);
}

class CostTripLoadingState extends HomeStates {}

class AddMessageState extends HomeStates {}

class CostTripSuccessState extends HomeStates {
  final MassageResponse massageResponse;
  CostTripSuccessState(this.massageResponse);
}

class CostTripFailureState extends HomeStates {
  final String errorMessage;
  CostTripFailureState(this.errorMessage);
}

class RateClientLoadingState extends HomeStates {}

class RateClientSuccessState extends HomeStates {
  final MassageResponse massageResponse;
  RateClientSuccessState(this.massageResponse);
}

class RateClientFailureState extends HomeStates {
  final String errorMessage;
  RateClientFailureState(this.errorMessage);
}
class ChangeMarkerState extends HomeStates {}
class SendMessageLoadingState extends HomeStates {}

class SendMessageSuccessState extends HomeStates {
  final MassageResponse massageResponse;
  SendMessageSuccessState(this.massageResponse);
}
class SendMessageFailureState extends HomeStates {
  final String errorMessage;
  SendMessageFailureState(this.errorMessage);
}
class GetMessageLoadingState extends HomeStates {}

class GetMessageSuccessState extends HomeStates {
  final GetMessagesResponse massageResponse;
  GetMessageSuccessState(this.massageResponse);
}
class GetMessageFailureState extends HomeStates {
  final String errorMessage;
  GetMessageFailureState(this.errorMessage);
}

class GetScheduledTripsLoadingState extends HomeStates {}

class GetScheduledTripsSuccessState extends HomeStates {
  final List<GetAllScheduledTripsResponse> getAllScheduledTripsResponse;
  GetScheduledTripsSuccessState(this.getAllScheduledTripsResponse);
}
class GetScheduledTripsFailureState extends HomeStates {
  final String errorMessage;
  GetScheduledTripsFailureState(this.errorMessage);
}
class GetAllNotificationsLoadingState extends HomeStates {}

class GetAllNotificationsSuccessState extends HomeStates {
  final List<GetAllNotificationsResponse> getAllNotificationsResponse;
  GetAllNotificationsSuccessState(this.getAllNotificationsResponse);
}
class GetAllNotificationsFailureState extends HomeStates {
  final String errorMessage;
  GetAllNotificationsFailureState(this.errorMessage);
}

class ChangeOldPasswordIconState extends HomeStates {}

class ChangePasswordIconState extends HomeStates {}

class UserRejectedTrip extends HomeStates {}

class ChangeConfirmPasswordIconState extends HomeStates {}
class ChangePasswordLoadingState extends HomeStates {}

class ChangePasswordSuccessState extends HomeStates {
  final MassageResponse changePasswordResponse;

  ChangePasswordSuccessState({required this.changePasswordResponse});
}

class ChangePasswordFailureState extends HomeStates {
  final String error;

  ChangePasswordFailureState({required this.error});
}
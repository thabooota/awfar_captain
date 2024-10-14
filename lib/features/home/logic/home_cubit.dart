import 'dart:convert';
import 'dart:developer';

import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/core/utils/location_service.dart';
import 'package:awfar_captain/features/chat/data/models/request/send_message_request_body.dart';
import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';
import 'package:awfar_captain/features/home/data/models/requests/store_driver_trip_request_body.dart';
import 'package:awfar_captain/features/home/data/models/requests/update_status_driver_request_body.dart';
import 'package:awfar_captain/features/home/data/models/response/get_trip_response.dart';
import 'package:awfar_captain/features/home/data/models/response/massage_response.dart';
import 'package:awfar_captain/features/home/data/models/response/trip_accepted_response.dart';
import 'package:awfar_captain/features/home/data/repo/routes_rep.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/arrived_meeting_place_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/finish_trip_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/meet_client_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/offline_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/ride_request_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/start_trip_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/utils/pusher_config.dart';
import '../../chat/data/models/request/get_message_request_body.dart';
import '../data/models/requests/accept_trip_request_body.dart';
import '../data/models/requests/get_routes_request_body.dart';
import '../data/models/requests/rate_client_request_body.dart';
import '../data/models/response/get_routes_response.dart';
import '../data/models/response/trips_pending_response.dart';
import '../data/repo/home_repo.dart';
import '../ui/widgets/search_for_rides_bottom_sheet.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;
  final RoutesRepo _routesRepo;

  HomeCubit(
    this._homeRepo,
    this._routesRepo,
  ) : super(InitialHomeState());

  bool isOnline = false;
  BottomSheetStates bottomSheetStates = BottomSheetStates.offline;
  TextEditingController chargerController = TextEditingController();
  TextEditingController commentRateController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> tripCostFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> chatFormKey = GlobalKey<FormState>();
  double rate = 0;

  void chaneConnectionState(bool value) {
    isOnline = value;
    if (value) {
      initializePusherNotifications(
          channelName: 'TripsPending', onEvent: onEvent);
      changeBottomSheetState(BottomSheetStates.searchForRides);
      emit(ChangeConnectionState());
    } else {
      changeBottomSheetState(BottomSheetStates.offline);
      emit(ChangeConnectionState());
    }
    emit(ChangeConnectionState());
  }

  Widget bottomSheets() {
    switch (bottomSheetStates) {
      case BottomSheetStates.searchForRides:
        return const SearchForRidesBottomSheet();
      case BottomSheetStates.offline:
        return const OfflineBottomSheet();
      case BottomSheetStates.rideRequest:
        return const RideRequestBottomSheet();
      case BottomSheetStates.meetClient:
        return const MeetClientBottomSheet();
      case BottomSheetStates.arrivingPlace:
        return const ArrivedMeetingPlaceBottomSheet();
      case BottomSheetStates.startTrip:
        return const StartTripBottomSheet();
      case BottomSheetStates.endTrip:
        return const FinishTripBottomSheet();
    }
  }

  changeBottomSheetState(BottomSheetStates state) {
    bottomSheetStates = state;
    emit(ChangeBottomSheetState());
  }

  late PusherConfig _pusherConfig;

  initializePusherNotifications(
      {required onEvent, required String channelName}) async {
    _pusherConfig = PusherConfig();

    _pusherConfig.initPusher(onEvent, channelName: channelName);
  }

  TripsPendingResponse? tripsPendingResponse;

  void onEvent(PusherEvent event) {
    try {
      log("event name :${event.eventName}");
      if (event.eventName == "event") {
        log("here");
        tripsPendingResponse =
            TripsPendingResponse.fromJson(json.decode(event.data));
        getRoutes(
            lat: double.parse(tripsPendingResponse!.from_lat),
            long: double.parse(tripsPendingResponse!.from_long));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  List<MessageInfo> messages = [];

  void emitGetMessagesState() async {
    messages = [];
    emit(GetMessageLoadingState());
    final getMessagesResponse = await _homeRepo.getMessages(
      getMessagesRequestBody: GetMessagesRequestBody(
        driverId: SharedPreferencesManager.getData(key: PrefsManager.driverId)
            .toString(),
        clientId: tripAcceptedResponse!.Client.Client_id.toString(),
      ),
    );
    getMessagesResponse.when(
      success: (GetMessagesResponse getMessagesResponse) {
        messages = getMessagesResponse.messages;
        emit(GetMessageSuccessState(getMessagesResponse));
      },
      failure: (error) {
        emit(GetMessageFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitAddMessageState({required MessageInfo messageInfo}) {
    messages.add(messageInfo);
    emit(AddMessageState());
  }

  void emitSendMessageState() async {
    emit(SendMessageLoadingState());
    final response = await _homeRepo.sendMessage(
      sendMessageRequestBody: SendMessageRequestBody(
        sender: 'driver',
        message: messageController.text,
        // TODO: add client id
        client_id: tripAcceptedResponse!.Client.Client_id.toString(),
        driver_id: SharedPreferencesManager.getData(key: PrefsManager.driverId)
            .toString(),
      ),
    );
    response.when(success: (MassageResponse message) {
      emitAddMessageState(
        messageInfo: MessageInfo(
          sender: "driver",
          id: SharedPreferencesManager.getData(key: PrefsManager.driverId),
          message: messageController.text,
        ),
      );
      messageController.clear();
      emit(SendMessageSuccessState(message));
    }, failure: (errorMessage) {
      emit(SendMessageFailureState(errorMessage.apiErrorModel.message));
    });
  }

  LocationService locationService = LocationService();

  late GetRoutesResponse routesResponse;
  List<LatLng> latLng = [];

  Future<void> getRoutes({required double lat, required double long}) async {
    emit(GetRoutesLoadingState());
    LocationData myLocationLatLng = await locationService.getLocation();
    GetRoutesRequestBody getRoutesRequestBody = GetRoutesRequestBody(
      origin: LocationInfo(
        location: LocationInfoData(
          latLng: LatLngInfo(
            latitude: myLocationLatLng.latitude!,
            longitude: myLocationLatLng.longitude!,
          ),
        ),
      ),
      destination: LocationInfo(
        location: LocationInfoData(
          latLng: LatLngInfo(
            latitude: lat,
            longitude: long,
          ),
        ),
      ),
      routeModifiers: const RouteModifiers(),
    );
    final routes =
        await _routesRepo.getRoutes(getRoutesRequestBody: getRoutesRequestBody);
    routes.when(success: (GetRoutesResponse getRoutesResponse) {
      latLng = PolylinePoints()
          .decodePolyline(
              getRoutesResponse.routes.first.polyline.encodedPolyline)
          .map((pointLatLng) =>
              LatLng(pointLatLng.latitude, pointLatLng.longitude))
          .toList();

      routesResponse = getRoutesResponse;

      emitStoreDriverTrip(
        distance: getRoutesResponse.routes[0].distanceMeters,
      );
      emit(GetRoutesSuccessState(getRoutesResponse));
    }, failure: (error) {
      emit(GetRoutesFailureState(error.toString()));
    });
  }

  void emitStoreDriverTrip({required double distance}) async {
    emit(StoreDriverTripLoadingState());
    final response = await _homeRepo.storeDriverTrip(
        token: SharedPreferencesManager.getData(key: PrefsManager.token),
        storeDriverTripRequestBody: StoreDriverTripRequestBody(
            trip_id: tripsPendingResponse!.trip_id,
            driver_id:
                SharedPreferencesManager.getData(key: PrefsManager.driverId),
            distance: distance));
    response.when(success: (data) {
      initializePusherNotifications(
          onEvent: onResetTrip,
          channelName:
              'DriverNotification.${SharedPreferencesManager.getData(key: PrefsManager.driverId)}');
      emit(StoreDriverTripSuccessState(data));
    }, failure: (error) {
      emit(StoreDriverTripFailureState(error.toString()));
    });
  }

  RestTripResponse? restTripResponse;

  void onResetTrip(PusherEvent event) {
    try {
      log("event name : ${event.eventName}");
      if (event.eventName == "event") {
        restTripResponse = RestTripResponse(
            data: TripInfo(
                from_long: json.decode(event.data)["data"]["from_long"],
                from_lat: json.decode(event.data)["data"]["from_lat"],
                to_long: json.decode(event.data)["data"]["to_long"],
                price: json.decode(event.data)["data"]["price"],
                form: json.decode(event.data)["data"]["from"],
                to: json.decode(event.data)["data"]["to"],
                to_lat: json.decode(event.data)["data"]["to_lat"],
                tripId: json.decode(event.data)["data"]["Trip-id"],
                Client_Name: json.decode(event.data)["data"]["Client_Name"]));
        log(restTripResponse!.data.Client_Name);
        changeBottomSheetState(BottomSheetStates.rideRequest);
        emit(RestTripRequestState());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  TripAcceptedResponse? tripAcceptedResponse;

  void emitAcceptedTripRequestState() async {
    emit(AcceptedTripLoadingState());

    final response = await _homeRepo.acceptedTrip(
        acceptTripRequestBody: AcceptOrRejectedTripRequestBody(
            id: restTripResponse!.data.tripId,
            driver_id:
                SharedPreferencesManager.getData(key: PrefsManager.driverId)));
    response.when(success: (data) {
      tripAcceptedResponse = data;
      // getRoutes(
      //     lat: double.parse(restTripResponse!.data.from_lat),
      //     long: double.parse(restTripResponse!.data.from_long),
      // );
      emit(AcceptedTripSuccessState(data));
    }, failure: (error) {
      emit(AcceptedTripFailureState(error.toString()));
    });
  }

  void emitRejectedTripRequestState() async {
    emit(RejectedTripLoadingState());
    final response = await _homeRepo.rejectedTrip(
        rejectTripRequestBody: AcceptOrRejectedTripRequestBody(
            driver_id: SharedPreferencesManager.getData(
              key: PrefsManager.driverId,
            ),
            id: restTripResponse!.data.tripId));
    response.when(success: (data) {
      initializePusherNotifications(
          channelName: 'TripsPending', onEvent: onEvent);
      emit(RejectedTripSuccessState(data));
    }, failure: (error) {
      emit(RejectedTripFailureState(error.toString()));
    });
  }

  void emitTripCostState() async {
    emit(CostTripLoadingState());
    final response = await _homeRepo.tripCost(
        token: SharedPreferencesManager.getData(key: PrefsManager.token),
        tripId: tripAcceptedResponse!.TripID,
        charge: chargerController.hashCode);
    response.when(success: (data) {
      changeBottomSheetState(BottomSheetStates.searchForRides);
      emit(CostTripSuccessState(data));
    }, failure: (error) {
      emit(CostTripFailureState(error.toString()));
    });
  }

  void emitUpdateDriverStatus({required String status}) async {
    emit(UpdateStatusTripLoadingState());
    final response = await _homeRepo.updateDriverStatus(
      updateStatusTripRequestBody: UpdateStatusDriverRequestBody(
          trip_id: tripAcceptedResponse!.TripID, status: status),
    );
    response.when(success: (data) {
      emit(UpdateStatusTripSuccessState(data));
    }, failure: (error) {
      emit(UpdateStatusTripFailureState(error.toString()));
    });
  }

  void emitRateClientStates() async {
    emit(RateClientLoadingState());
    final response = await _homeRepo.rateClient(
        driverId: tripAcceptedResponse!.Client.Client_id,
        token: SharedPreferencesManager.getData(key: PrefsManager.token),
        tripId: tripAcceptedResponse!.TripID,
        rateClientRequestBody: RateClientRequestBody(
            comment: commentRateController.text, rate: rate.toString()));
    response.when(success: (data) {
      changeBottomSheetState(BottomSheetStates.searchForRides);
      emit(RateClientSuccessState(data));
    }, failure: (error) {
      emit(RateClientFailureState(error.toString()));
    });
  }

// void updateCurrentLocation() async {
//   try {
//     LocationData locationData = await locationService.getLocation();
//
//     myLocationLatLng =
//         LatLng(locationData.latitude!, locationData.longitude!);
//
//     Marker currentLocationMarker = Marker(
//       markerId: const MarkerId('my location'),
//       position: myLocationLatLng,
//       icon: myLocationMarkerIcon,
//     );
//
//     CameraPosition myCurrentCameraPosition = CameraPosition(
//       target: myLocationLatLng,
//       zoom: 15,
//     );
//
//     googleMapController.animateCamera(
//         CameraUpdate.newCameraPosition(myCurrentCameraPosition));
//     markers.add(currentLocationMarker);
//
//     getLocationDetails();
//
//     emit(GetCurrentLocationState());
//   } on LocationServiceException catch (e) {
//     debugPrint("\x1B[33m${e.toString()}\x1B[0m");
//     SystemNavigator.pop();
//   } on LocationPermissionException catch (e) {
//     debugPrint("\x1B[33m${e.toString()}\x1B[0m");
//     SystemNavigator.pop();
//   } catch (e) {
//     debugPrint("\x1B[33m${e.toString()}\x1B[0m");
//     // SystemNavigator.pop();
//   }
// }
}

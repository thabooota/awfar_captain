import 'dart:convert';
import 'dart:math';
import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/core/utils/location_service.dart';
import 'package:awfar_captain/features/chat/data/models/request/send_message_request_body.dart';
import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';
import 'package:awfar_captain/features/home/data/models/requests/store_driver_trip_request_body.dart';
import 'package:awfar_captain/features/home/data/models/requests/update_status_driver_request_body.dart';
import 'package:awfar_captain/features/home/data/models/response/get_all_scheduled_trips_response.dart';
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
import 'package:awfar_captain/features/notification/data/response/get_all_notifications_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/utils/pusher_config.dart';
import '../../../lang/locale_keys.g.dart';
import '../../chat/data/models/request/get_message_request_body.dart';
import '../data/models/requests/accept_trip_request_body.dart';
import '../data/models/requests/change_password_request_body.dart';
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

  bool isOnline = true;
  BitmapDescriptor myLocationMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor locationMarkerAnotherIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor locationMarkerIcon = BitmapDescriptor.defaultMarker;
  BottomSheetStates bottomSheetStates = BottomSheetStates.offline;
  TextEditingController chargerController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
                TextEditingController();

  bool hideOldPassword = true;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  TextEditingController commentRateController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> tripCostFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> chatFormKey = GlobalKey<FormState>();
  double rate = 0;
  late CameraPosition cameraPosition;
  LocationService locationService = LocationService();
  Set<Polyline> polyLines = {};
  bool isFirstCall = true;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  late LatLng currentLocation;
  bool? scheduleTrip;
  GetAllScheduledTripsResponse? scheduledTripsResponse;
   bool notification = true;

  // Maps

  void onSelectLang(BuildContext context, String value) {
    if (value == LocaleKeys.en.tr()) {
      SharedPreferencesManager.saveData(key: PrefsManager.lang, value: "en")
          .then((_) async {
        await context.setLocale(const Locale('en'));
      });
    } else {
      SharedPreferencesManager.saveData(key: PrefsManager.lang, value: "ar")
          .then((_) async {
        await context.setLocale(const Locale('ar'));
      });
    }
    emit(ChangeAppLangState());
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    double minLat = double.infinity;
    double maxLat = double.negativeInfinity;
    double minLng = double.infinity;
    double maxLng = double.negativeInfinity;

    for (LatLng point in points) {
      minLat = min(minLat, point.latitude);
      maxLat = max(maxLat, point.latitude);
      minLng = min(minLng, point.longitude);
      maxLng = max(maxLng, point.longitude);
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  void updateCurrentLocation() async {
    try {
      await locationService.checkAndRequestLocationPermission();
      await locationService.checkAndRequestLocationService();
      locationService.getRealTimeLocationData().listen((LocationData locationData) {
        currentLocation = LatLng(locationData.latitude!, locationData.longitude!);

        CameraPosition myCurrentCameraPosition = CameraPosition(
          target: currentLocation,
          zoom: 17,
        );

        googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(myCurrentCameraPosition));
        emit(GetCurrentLocationState());
      });
    } on LocationServiceException catch (e) {
      debugPrint("\x1B[33m${e.toString()}\x1B[0m");
      SystemNavigator.pop();
    } on LocationPermissionException catch (e) {
      debugPrint("\x1B[33m${e.toString()}\x1B[0m");
      SystemNavigator.pop();
    } catch (e) {
      debugPrint("\x1B[33m${e.toString()}\x1B[0m");
      // SystemNavigator.pop();
    }
  }

  void getMyCurrentLocation() async {
    try {
      LocationData locationData = await locationService.getLocation();
      currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
      setCameraPosition();
      Marker myLocationMarker = Marker(
        markerId: const MarkerId('my-location-marker'),
        position: currentLocation,
        icon: myLocationMarkerIcon,
      );
      markers.add(myLocationMarker);
    } on LocationServiceException catch (locationServiceException) {
      debugPrint(
          "locationServiceException.toString(): ${locationServiceException.toString()}");
    } on LocationPermissionException catch (locationPermissionException) {
      debugPrint(
          "locationPermissionException.toString(): ${locationPermissionException.toString()}");
    } catch (e) {
      debugPrint("e.toString(): ${e.toString()}");
    }
  }

  void initHomeCubit() {
    cameraPosition = const CameraPosition(
      target: LatLng(26.691628121516544, 29.98142945921261),
      zoom: 6.0,
    );
    locationService = LocationService();
    updateCurrentLocation();
  }

  late PusherConfig _pusherConfig;

  void setCameraPosition() {
    if (isFirstCall) {
      CameraPosition cameraPosition = CameraPosition(
        target: currentLocation,
        zoom: 17,
      );
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstCall = false;
    } else {
      googleMapController.animateCamera(
        CameraUpdate.newLatLng(currentLocation),
      );
    }
  }

  Marker? locationMarkerAnotherMarker;

  Marker? locationMarker;

  Future<void> getRoutes({
    required double latTo,
    required double longTo,
    double? latFrom,
    double? longFrom,
    required bool first,
  }) async {
    emit(GetRoutesLoadingState());
    LocationData myLocationLatLng = await locationService.getLocation();
    GetRoutesRequestBody getRoutesRequestBody = GetRoutesRequestBody(
      origin: LocationInfo(
        location: LocationInfoData(
          latLng: LatLngInfo(
            latitude: latFrom ?? myLocationLatLng.latitude!,
            longitude: longFrom ?? myLocationLatLng.longitude!,
          ),
        ),
      ),
      destination: LocationInfo(
        location: LocationInfoData(
          latLng: LatLngInfo(
            latitude: latTo,
            longitude: longTo,
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
      if (first) {
        emitStoreDriverTrip(
          distance: getRoutesResponse.routes[0].distanceMeters,
        );
      }
      emit(GetRoutesSuccessState(getRoutesResponse));
    }, failure: (error) {
      emit(GetRoutesFailureState(error.toString()));
    });
  }

  Future<void> displayRoute(
      {required double lat1,
      required double long1,
      double? lat2,
      double? long2}) async {
    locationMarker = Marker(
      markerId: const MarkerId('destination location'),
      position: LatLng(lat1, long1),
      icon: locationMarkerIcon,
    );

    if (lat2 != null && long2 != null) {
      locationMarkerAnotherMarker = Marker(
        markerId: const MarkerId('destination location2'),
        position: LatLng(lat2, long2),
        icon: locationMarkerAnotherIcon,
      );
    }

    Polyline route = Polyline(
      color: ColorManager.blue,
      width: 5,
      polylineId: const PolylineId("route"),
      points: latLng,
    );

    LatLngBounds bounds = getLatLngBounds(latLng);

    googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 32.0))
        .whenComplete(() {
      markers.add(locationMarker!);
      if (locationMarkerAnotherMarker != null) {
        markers.add(locationMarkerAnotherMarker!);
      }
      polyLines.add(route);

    });
    emit(DisplayRouteState());
  }

  void chaneConnectionState(bool value) {
    isOnline = value;
    if (value) {
      initializePusherNotifications(
         channelName: 'TripsPending', onEvent: onEvent);
      changeBottomSheetState(
        state: BottomSheetStates.searchForRides,
      );
      emit(ChangeConnectionState());
    } else {
      _pusherConfig.disconnect();
      changeBottomSheetState(
        state: BottomSheetStates.offline,
      );
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
        return MeetClientBottomSheet();
      case BottomSheetStates.arrivingPlace:
        return const ArrivedMeetingPlaceBottomSheet();
      case BottomSheetStates.startTrip:
        return const StartTripBottomSheet();
      case BottomSheetStates.endTrip:
        return const FinishTripBottomSheet();
    }
  }

  changeBottomSheetState({required BottomSheetStates state}) {
    bottomSheetStates = state;
    emit(ChangeBottomSheetState());
  }

  // home logic

  initializePusherNotifications(
      {
        required onEvent,
      required String channelName,
      }) async {

    _pusherConfig = PusherConfig();

    _pusherConfig.initPusher(onEvent, channelName: channelName);

  }

  TripsPendingResponse? tripsPendingResponse;

  void onEvent(PusherEvent event) {
    try {
      print("event name ggggggggggggggggggg:${event.eventName}");
      if (event.eventName == "event") {
        print("here");
        tripsPendingResponse =
            TripsPendingResponse.fromJson(json.decode(event.data));
        getRoutes(
          latTo: double.parse(tripsPendingResponse!.from_lat),
          longTo: double.parse(tripsPendingResponse!.from_long),
          first: true,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<MessageInfo> messages = [];

  late GetRoutesResponse routesResponse;

  List<LatLng> latLng = [];

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
          channelName: 'DriverNotification.${SharedPreferencesManager.getData(key: PrefsManager.driverId)}');
      emit(StoreDriverTripSuccessState(data));
    }, failure: (error) {
      emit(StoreDriverTripFailureState(error.toString()));
    });
  }


  void configPusherConnectPendingAndDisconnect(){
    print("disconnecting ###################################################################################");
    _pusherConfig.disconnect();
    print("connecting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55%%%%");
    initializePusherNotifications(
        channelName: 'TripsPending', onEvent: onEvent);
  }

  RestTripResponse? restTripResponse;

  void onResetTrip(PusherEvent event) {
    try {
      print("event name : ${event.eventName}");
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
                time: json.decode(event.data)["data"]["time"],
                date: json.decode(event.data)["data"]["date"],
                Client_Name: json.decode(event.data)["data"]["Client_Name"]));
        print(restTripResponse!.data.Client_Name);
        changeBottomSheetState(
          state: BottomSheetStates.rideRequest,
        );
        getRoutes(
                latTo: double.parse(restTripResponse!.data.to_lat),
                longTo: double.parse(restTripResponse!.data.to_long),
                latFrom: double.parse(restTripResponse!.data.from_lat),
                longFrom: double.parse(restTripResponse!.data.from_long),
                first: false)
            .then((_) {
          displayRoute(
            lat1: double.parse(restTripResponse!.data.from_lat),
            long1: double.parse(restTripResponse!.data.from_long),
            lat2: double.parse(restTripResponse!.data.to_lat),
            long2: double.parse(restTripResponse!.data.to_long),
          );
        });
        emit(RestTripRequestState());
      }
    } catch (e) {
      print(e.toString());
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
      _pusherConfig.disconnect();
      if (data.message == null) {
        polyLines = {};
        markers.remove(locationMarker);
        markers.remove(locationMarkerAnotherMarker);
        if (restTripResponse!.data.time == null &&
            restTripResponse!.data.date == null) {
          getRoutes(
            first: false,
            latTo: double.parse(restTripResponse!.data.from_lat),
            longTo: double.parse(restTripResponse!.data.from_long),
          ).then((_) {
            displayRoute(
              lat1: double.parse(restTripResponse!.data.from_lat),
              long1: double.parse(restTripResponse!.data.from_long),
            );
          });
        } else {
          initializePusherNotifications(
              channelName: 'TripsPending',
              onEvent: onEvent);
        }
        emit(AcceptedTripSuccessState(data));
      } else {
        initializePusherNotifications(
          channelName: 'TripsPending',
          onEvent: onEvent,
        );
        emit(UserRejectedTrip());
      }
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
      initializePusherNotifications(channelName: 'TripsPending', onEvent: onEvent);
      emit(RejectedTripSuccessState(data));
    }, failure: (error) {
      print(error);
      emit(RejectedTripFailureState(error.toString()));
    });
  }

  Future<void> emitUpdateDriverStatus({required String status}) async {
    emit(UpdateStatusTripLoadingState());
    final response = await _homeRepo.updateDriverStatus(
      updateStatusTripRequestBody: UpdateStatusDriverRequestBody(
          trip_id: scheduleTrip == true
              ? scheduledTripsResponse!.trip_id
              : tripAcceptedResponse!.TripID!,
          status: status),
    );
    response.when(success: (data) {
      emit(UpdateStatusTripSuccessState(data));
    }, failure: (error) {
      emit(UpdateStatusTripFailureState(error.toString()));
    });
  }

  void emitTripCostState() async {
    emit(CostTripLoadingState());
    final response = await _homeRepo.tripCost(
        token: SharedPreferencesManager.getData(key: PrefsManager.token),
        tripId: tripAcceptedResponse!.TripID!,
        charge: chargerController.hashCode);
    response.when(success: (data) {
      changeBottomSheetState(
        state: BottomSheetStates.searchForRides,
      );
      emit(CostTripSuccessState(data));
    }, failure: (error) {
      emit(CostTripFailureState(error.toString()));
    });
  }

  void emitRateClientStates() async {
    emit(RateClientLoadingState());
    final response = await _homeRepo.rateClient(
        driverId: scheduleTrip == true
            ? scheduledTripsResponse!.client.Client_id
            : tripAcceptedResponse!.Client!.Client_id,
        token: SharedPreferencesManager.getData(key: PrefsManager.token),
        tripId: scheduleTrip == true
            ? scheduledTripsResponse!.trip_id
            : tripAcceptedResponse!.TripID!,
        rateClientRequestBody: RateClientRequestBody(
            comment: commentRateController.text, rate: rate.toString()));
    response.when(success: (data) {
      changeBottomSheetState(
        state: BottomSheetStates.searchForRides,
      );
      emit(RateClientSuccessState(data));
    }, failure: (error) {
      emit(RateClientFailureState(error.toString()));
    });
  }

  // chat logic

  void emitGetMessagesState() async {
    messages = [];
    emit(GetMessageLoadingState());
    final getMessagesResponse = await _homeRepo.getMessages(
      getMessagesRequestBody: GetMessagesRequestBody(
        driverId: SharedPreferencesManager.getData(key: PrefsManager.driverId)
            .toString(),
        clientId: tripAcceptedResponse!.Client!.Client_id.toString(),
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
        client_id: tripAcceptedResponse!.Client!.Client_id.toString(),
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

  List<bool> myTripsActive = [];

  List<GetAllScheduledTripsResponse> scheduledTrips = [];

  void emitGetAllScheduledTrips() async {
    myTripsActive = [];
    emit(GetScheduledTripsLoadingState());

    final response = await _homeRepo.getAllScheduled(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    response.when(success:
        (List<GetAllScheduledTripsResponse> getScheduledTripsResponse) {
      getScheduledTripsResponse.forEach((_) => myTripsActive.add(false));
      scheduledTrips = getScheduledTripsResponse
          .where((trip) => trip.status != "canceled")
          .toList();
      emit(GetScheduledTripsSuccessState(getScheduledTripsResponse));
    }, failure: (error) {
      emit(GetScheduledTripsFailureState(error.toString()));
    });
  }

  List<GetAllNotificationsResponse> myNotifications = [];

  void emitGetAllNotifications() async {
    myNotifications = [];
    emit(GetAllNotificationsLoadingState());
    final response = await _homeRepo.getAllNotifications(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    response.when(success:
        (List<GetAllNotificationsResponse> getAllNotificationsResponse) {
      myNotifications = getAllNotificationsResponse;
      emit(GetAllNotificationsSuccessState(getAllNotificationsResponse));
    }, failure: (error) {
      emit(GetAllNotificationsFailureState(error.toString()));
    });
  }

  // change password

  void emitChangeOldPasswordIconState() {
    hideOldPassword = !hideOldPassword;
    emit(ChangeOldPasswordIconState());
  }

  void emitChangePasswordIconState() {
    hidePassword = !hidePassword;
    emit(ChangePasswordIconState());
  }

  void emitChangeConfirmPasswordIconState() {
    hideConfirmPassword = !hideConfirmPassword;
    emit(ChangeConfirmPasswordIconState());
  }

  void emitChangePasswordState() async {
    emit(ChangePasswordLoadingState());

    final changePasswordResponse = await _homeRepo.changePassword(
      token: SharedPreferencesManager.getData(
        key: PrefsManager.token,
      ),
      changePasswordRequestBody: ChangePasswordRequestBody(
        old_password: oldPasswordController.text,
        new_password: newPasswordController.text,
        new_password_confirmation: confirmNewPasswordController.text,
      ),
    );

    changePasswordResponse.when(
      success: (changePasswordResponse) {
        emit(ChangePasswordSuccessState(
            changePasswordResponse: changePasswordResponse));
      },
      failure: (ErrorHandler error) {
        emit(ChangePasswordFailureState(error: error.apiErrorModel.message));
      },
    );
  }
}

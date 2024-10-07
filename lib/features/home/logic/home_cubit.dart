import 'dart:developer';
import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/core/utils/location_service.dart';
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
import 'package:location/location.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../core/utils/pusher_config.dart';
import '../data/models/requests/get_routes_request_body.dart';
import '../data/models/response/get_routes_response.dart';
import '../data/models/response/trips_pending_response.dart';
import '../data/repo/home_repo.dart';
import '../ui/widgets/search_for_rides_bottom_sheet.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;
  final RoutesRepo _routesRepo;
  HomeCubit(this._homeRepo, this._routesRepo,) : super(InitialHomeState());

  bool isOnline = false;
  BottomSheetStates bottomSheetStates = BottomSheetStates.searchForRides;

  void chaneConnectionState (bool value){
    isOnline = value;
    if(!value)
      {
        changeBottomSheetState(BottomSheetStates.offline);
      }else{
      initializePusherNotifications();
      changeBottomSheetState(BottomSheetStates.searchForRides);
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



  TripsPendingResponse ?tripsPendingResponse;

  void onEvent(PusherEvent event) {
    log("event came: ${event.data}");
    try {
      log("evvvvvvent name :${event.eventName}");
      if (event.eventName == "event") {
        log("here");
        tripsPendingResponse = event.data;
        if (tripsPendingResponse!.trip_id != null) {
          print(tripsPendingResponse!.trip_id);
          getRoutes();
        }
      }
    } catch (e) {
      print('Errrroooooooooooooooooooorrrr');
      log(e.toString());
    }
  }
  late PusherConfig _pusherConfig;
  initializePusherNotifications() async {
    _pusherConfig = PusherConfig();

    _pusherConfig.initPusher(onEvent ,channelName: 'TripsPending');
  }

  LocationService locationService = LocationService();

  Future<void> getRoutes() async {
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
            latitude: double.parse(tripsPendingResponse!.from_lat),
            longitude: double.parse(tripsPendingResponse!.from_long),
          ),
        ),
      ),
      routeModifiers: const RouteModifiers(),
    );
    final routes =
    await _routesRepo.getRoutes(getRoutesRequestBody: getRoutesRequestBody);
    routes.when(success: (GetRoutesResponse getRoutesResponse) {
      print(getRoutesResponse.routes[0].distanceMeters);
      emit(GetRoutesSuccessState(getRoutesResponse));
    }, failure: (error) {
      emit(GetRoutesFailureState(error.toString()));
    });
  }

}

import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/arrived_meeting_place_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/finish_trip_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/meet_client_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/offline_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/ride_request_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/start_trip_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/widgets/search_for_rides_bottom_sheet.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  bool isOnline = true;
  BottomSheetStates bottomSheetStates = BottomSheetStates.searchForRides;


  void chaneConnectionState (bool value){
    isOnline = value;
    if(!value)
      {
        changeBottomSheetState(BottomSheetStates.offline);
      }else{
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
}

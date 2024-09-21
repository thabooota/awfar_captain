import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/utils/enums.dart';
import 'package:awfar_captain/features/home/data/models/requests/upload_profile_request_body.dart';
import 'package:awfar_captain/features/home/data/models/response/get_profile_response.dart';
import 'package:awfar_captain/features/home/logic/home_state.dart';
import 'package:awfar_captain/features/home/ui/widgets/arrived_meeting_place_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/finish_trip_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/meet_client_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/offline_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/ride_request_bottom_sheet.dart';
import 'package:awfar_captain/features/home/ui/widgets/start_trip_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/home_repo.dart';
import '../ui/widgets/search_for_rides_bottom_sheet.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(InitialHomeState());

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

  String token = SharedPreferencesManager.getSecuredString(PrefsManager.token);
  ProfileInfo ?myProfile;

  void emitGetProfileStates() async {
    emit(GetProfileLoading());
    final response = await _homeRepo.getProfile(
        token: token);

    response.when(
        success: (data) {
          myProfile = data.profileInfo;
          emit(GetProfileSuccess(profile: data));
        },
        failure: (error) {
          print('Errrrrrrrrrrrrorrrrrrrrrrr');
          print(error.toString());
          emit(GetProfileError(error:error.apiErrorModel.message));
        });
  }

  TextEditingController editingNameController = TextEditingController();
  TextEditingController editingEmailController = TextEditingController();
  TextEditingController editingPhoneController = TextEditingController();
  TextEditingController editingAddressController = TextEditingController();
  TextEditingController editingWorkAreaController = TextEditingController();

  void emitUpdateProfile() async {
    emit(EditProfileLoading());
    final response = await _homeRepo.updateProfile(
        token: token,
      updateRequestBody: UpdateProfileRequestBody(
          name: editingNameController.text == '' ? myProfile!.name : editingNameController.text,
          email: editingEmailController.text == '' ? myProfile!.email : editingEmailController.text,
          phone:editingPhoneController.text == '' ? myProfile!.phone : editingPhoneController.text,
          address: editingAddressController.text == '' ? myProfile!.address! : editingAddressController.text,
          workArea: editingWorkAreaController.text == '' ? myProfile!.workArea! : editingWorkAreaController.text,
      ),
    );
        response.when(
            success: (data) {
              print('Profile updated successfully');
              emit(EditProfileSuccess(profile: data));
            },
            failure: (error) {
              print(error.toString());
              emit(EditProfileError(error: error.apiErrorModel.message));
            });
  }
}

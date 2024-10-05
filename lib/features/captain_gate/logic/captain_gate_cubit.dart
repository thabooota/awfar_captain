import 'dart:developer';

import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/utils/pusher_config.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_all_trips_response.dart';
import 'package:awfar_captain/features/captain_gate/data/model/response/get_my_balance_response.dart';
import 'package:awfar_captain/features/captain_gate/data/repo/repo.dart';
import 'package:awfar_captain/features/captain_gate/logic/captain_gate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../home/data/models/requests/upload_profile_request_body.dart';
import '../../home/data/models/response/get_profile_response.dart';

class CaptainGateCubit extends Cubit<CaptainGateStates>{
  final CaptainGateRepo _captainGateRepo;

  late PusherConfig _pusherConfig;
  CaptainGateCubit(this._captainGateRepo) : super(CaptainGateInitial());
  GetMyBalanceResponse ?myBalanceResponse;
  void emitGetMyBalance() async {
    emit(GetMyBalanceLoading());

    final response = await _captainGateRepo.getMyBalance(token: SharedPreferencesManager.getData(key: PrefsManager.token));

    response.when(success: (balance) {
      myBalanceResponse = balance;
      emit(GetMyBalanceSuccess(balance));
    }, failure: (error) {
      print(error.toString());
      emit(GetMyBalanceError(error.toString()));
    });
  }
  String token = SharedPreferencesManager.getData( key: PrefsManager.token,);
  ProfileInfo ?myProfile;

  void onEvent(PusherEvent event) {
    log("event came: ${event.data}");
    try {
      log("evvvvvvent name :${event.eventName}");
      if (event.eventName == "notification") {
        log("here");
        log("3333333333333333333333333333333333333333333333");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  initializePusherNotifications(roomId) async {
    _pusherConfig = PusherConfig();

    _pusherConfig.initPusher(onEvent ,channelName: 'driver', roomId: roomId);
  }

  void emitGetProfileStates() async {
    emit(GetProfileLoading());
    final response = await _captainGateRepo.getProfile(
        token: token);

    response.when(
        success: (data) {
          myProfile = data.profileInfo;
          log("################################################################################################");
          initializePusherNotifications(data.profileInfo.id.toString());
          log("################################################################################################");
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
    final response = await _captainGateRepo.updateProfile(
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

  GetAllTripsResponse ?myTrips;
  void emitGetAllTrips() async {

    emit(GetAllTripsLoading());

    final response = await _captainGateRepo.getAllTrips(token: token);

    response.when(
        success: (data) {
          myTrips = data;
          print('anaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/////////////////');
          emit(GetAllTripsSuccess(myTrips: data));
        },
        failure: (error) {
          print(error.toString());
          emit(GetAllTripsError(error: error.apiErrorModel.message));
        });
  }
}
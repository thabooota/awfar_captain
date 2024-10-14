import 'package:awfar_captain/features/captain_gate/data/model/response/get_my_balance_response.dart';
import 'package:awfar_captain/features/home/data/models/response/get_profile_response.dart';
import '../../home/data/models/response/update_profile_response.dart';
import '../data/model/response/get_all_trips_response.dart';


abstract class CaptainGateStates {}

class CaptainGateInitial extends CaptainGateStates {}
class GetMyBalanceLoading extends CaptainGateStates {}
class GetMyBalanceSuccess extends CaptainGateStates {
  final GetMyBalanceResponse getMyBalanceResponse;
  GetMyBalanceSuccess(this.getMyBalanceResponse);
}
class GetMyBalanceError extends CaptainGateStates {
  final String errorMessage;
  GetMyBalanceError(this.errorMessage);
}
class GetProfileLoading extends CaptainGateStates {}

class GetProfileSuccess extends CaptainGateStates {
  final GetProfileResponse profile;
  GetProfileSuccess({required this.profile});
}

class GetProfileError extends CaptainGateStates {
  final String error;
  GetProfileError({required this.error});
}

class EditProfileLoading extends CaptainGateStates {}

class EditProfileSuccess extends CaptainGateStates {
  final UpdateProfileResponse profile;
  EditProfileSuccess({required this.profile});
}

class EditProfileError extends CaptainGateStates {
  final String error;
  EditProfileError({required this.error});
}

class GetAllTripsLoading extends CaptainGateStates {}

class GetAllTripsSuccess extends CaptainGateStates {
  final GetTripsResponse myTrips;
  GetAllTripsSuccess({required this.myTrips});
}

class GetAllTripsError extends CaptainGateStates {
  final String error;
  GetAllTripsError({required this.error});
}
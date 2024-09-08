import 'package:awfar_captain/features/home/data/models/response/get_profile_response.dart';
import '../data/models/response/update_profile_response.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class ChangeBottomSheetState extends HomeStates {}

class ChangeConnectionState extends HomeStates {}

class GetProfileLoading extends HomeStates {}

class GetProfileSuccess extends HomeStates {
  final GetProfileResponse profile;
  GetProfileSuccess({required this.profile});
}

class GetProfileError extends HomeStates {
  final String error;
  GetProfileError({required this.error});
}

class EditProfileLoading extends HomeStates {}

class EditProfileSuccess extends HomeStates {
  final UpdateProfileResponse profile;
  EditProfileSuccess({required this.profile});
}

class EditProfileError extends HomeStates {
  final String error;
  EditProfileError({required this.error});
}

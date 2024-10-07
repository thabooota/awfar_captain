import 'package:awfar_captain/features/home/data/models/response/get_profile_response.dart';
import 'package:awfar_captain/features/home/data/models/response/get_routes_response.dart';
import '../data/models/response/update_profile_response.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class ChangeBottomSheetState extends HomeStates {}

class ChangeConnectionState extends HomeStates {}
class GetRoutesLoadingState extends HomeStates {}
class GetRoutesSuccessState extends HomeStates {
  final GetRoutesResponse getRoutesResponse;
  GetRoutesSuccessState(this.getRoutesResponse);
}
class GetRoutesFailureState extends HomeStates {
  final String errorMessage;
  GetRoutesFailureState(this.errorMessage);
}



import 'package:awfar_captain/features/authentication/data/models/responses/login_response.dart';

abstract class LoginStates {}

class LoginStateInitial extends LoginStates {}

final class LoginLoadingState extends LoginStates {}

final class ChangePasswordIconState extends LoginStates {}

final class LoginSuccessState extends LoginStates {
  final LoginResponse response;

  LoginSuccessState(this.response);
}


final class LoginFailureState extends LoginStates {
  final String message;

  LoginFailureState({required this.message});
}
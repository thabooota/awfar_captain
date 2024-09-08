import '../../data/models/responses/check_code_response.dart';
import '../../data/models/responses/forgot_password_response.dart';
import '../../data/models/responses/reset_password_response.dart';

abstract class ForgotPasswordStates {}

class InitialForgotPasswordState extends ForgotPasswordStates {}

class ChangePasswordIconState extends ForgotPasswordStates {}

class ChangeConfirmPasswordIconState extends ForgotPasswordStates {}

class ForgotPasswordLoadingState extends ForgotPasswordStates {}

class ForgotPasswordSuccessState extends ForgotPasswordStates {
  final ForgotPasswordResponse forgotPasswordResponse;

  ForgotPasswordSuccessState({required this.forgotPasswordResponse});
}

class ForgotPasswordFailureState extends ForgotPasswordStates {
  final String error;

  ForgotPasswordFailureState({required this.error});
}

class CheckCodeLoadingState extends ForgotPasswordStates {}

class CheckCodeSuccessState extends ForgotPasswordStates {
  final CheckCodeResponse checkCodeResponse;

  CheckCodeSuccessState({required this.checkCodeResponse});
}

class CheckCodeFailureState extends ForgotPasswordStates {
  final String error;

  CheckCodeFailureState({required this.error});
}

class ResetPasswordLoadingState extends ForgotPasswordStates {}

class ResetPasswordSuccessState extends ForgotPasswordStates {
  final ResetPasswordResponse resetPasswordResponse;

  ResetPasswordSuccessState({required this.resetPasswordResponse});
}

class ResetPasswordFailureState extends ForgotPasswordStates {
  final String error;

  ResetPasswordFailureState({required this.error});
}

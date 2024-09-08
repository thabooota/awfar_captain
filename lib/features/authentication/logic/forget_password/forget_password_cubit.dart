import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/requests/check_code_request_body.dart';
import '../../data/models/requests/forgot_password_request_body.dart';
import '../../data/models/requests/reset_password_request_body.dart';
import '../../data/models/responses/check_code_response.dart';
import '../../data/models/responses/forgot_password_response.dart';
import '../../data/models/responses/reset_password_response.dart';
import '../../data/repo/forgot_password_repo.dart';
import 'forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  final ForgotPasswordRepo _forgotPasswordRepo;

  ForgotPasswordCubit(this._forgotPasswordRepo)
      : super(InitialForgotPasswordState());

  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> verifyCodeFormKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  void emitChangePasswordIconState() {
    hidePassword = !hidePassword;
    emit(ChangePasswordIconState());
  }

  void emitChangeConfirmPasswordIconState() {
    hideConfirmPassword = !hideConfirmPassword;
    emit(ChangeConfirmPasswordIconState());
  }

  void emitForgotPasswordState() async {
    emit(ForgotPasswordLoadingState());

    final forgotPasswordResponse = await _forgotPasswordRepo.forgotPassword(
      forgotPasswordRequestBody: ForgotPasswordRequestBody(
        phone: "+2${phoneController.text}",
      ),
    );

    forgotPasswordResponse.when(
      success: (ForgotPasswordResponse forgotPasswordResponse) {
        emit(ForgotPasswordSuccessState(
            forgotPasswordResponse: forgotPasswordResponse));
      },
      failure:  (ErrorHandler error)  {
        emit(ForgotPasswordFailureState(error: error.apiErrorModel.message));
      },
    );
  }

  void emitCheckCodeState({required String phone}) async {
    emit(CheckCodeLoadingState());

    final checkCodeResponse = await _forgotPasswordRepo.checkCode(
      checkCodeRequestBody: CheckCodeRequestBody(
        phone: "+2$phone",
        code: otpController.text,
      ),
    );

    checkCodeResponse.when(
      success: (CheckCodeResponse checkCodeResponse) {
        emit(CheckCodeSuccessState(checkCodeResponse: checkCodeResponse));
      },
      failure:  (ErrorHandler error)  {
        emit(CheckCodeFailureState(error: error.apiErrorModel.message));
      },
    );
  }

  void emitResetPasswordState({required String phone}) async {
    emit(ResetPasswordLoadingState());

    final resetPasswordResponse = await _forgotPasswordRepo.resetPassword(
      resetPasswordRequestBody: ResetPasswordRequestBody(
        phone: "+2$phone",
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );

    resetPasswordResponse.when(
      success: (ResetPasswordResponse resetPasswordResponse) {
        emit(ResetPasswordSuccessState(
            resetPasswordResponse: resetPasswordResponse));
      },
      failure: (ErrorHandler error) {
        emit(ResetPasswordFailureState(error: error.apiErrorModel.message));
      },
    );
  }
}

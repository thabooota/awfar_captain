import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/features/authentication/data/models/requests/login_request_body.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/login_response.dart';
import 'package:awfar_captain/features/authentication/data/repo/login_repo.dart';
import 'package:awfar_captain/features/authentication/logic/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super (LoginStateInitial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool hidePassword = true;


  void emitChangePasswordIconState() {
    hidePassword = !hidePassword;
    emit(ChangePasswordIconState());
  }
  void emitLoginState() async {
    emit(LoginLoadingState());
    final response = await _loginRepo.login(
      LoginRequestBody(
        phone: "+2${phoneController.text}", password: passwordController.text, fcmToken: PrefsManager.fcmToken),
    );

    response.when(
        success: (LoginResponse response) {
      SharedPreferencesManager.saveData(
          key: PrefsManager.token,
          value:response.token
      );
      emit(LoginSuccessState(response));
    }, failure: (ErrorHandler error) {
      emit(LoginFailureState(message: error.apiErrorModel.message));
    });
  }

  void validateThenDoLogin(LoginCubit cubit) {
    if (cubit.loginFormKey.currentState!.validate()) {
      cubit.emitLoginState();
    }
  }
}
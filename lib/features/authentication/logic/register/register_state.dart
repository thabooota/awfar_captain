import 'package:awfar_captain/features/authentication/data/models/responses/add_details_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/upload_file_response.dart';
import '../../data/models/responses/register_response.dart';
import '../../data/models/responses/verify_phone_response.dart';

abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class ChangePasswordIconState extends RegisterStates {}

class ChangeConfirmPasswordIconState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterResponse registerResponse;

  RegisterSuccessState({required this.registerResponse});
}

class RegisterFailureState extends RegisterStates {
  final String error;

  RegisterFailureState({required this.error});
}

class VerifyPhoneLoadingState extends RegisterStates {}

class VerifyPhoneSuccessState extends RegisterStates {
  final VerifyPhoneResponse verifyPhoneResponse;

  VerifyPhoneSuccessState({required this.verifyPhoneResponse});
}

class VerifyPhoneFailureState extends RegisterStates {
  final String error;

  VerifyPhoneFailureState({required this.error});
}

class AddDetailsLoadingState extends RegisterStates {}

class AddDetailsSuccessState extends RegisterStates {
  final AddDetailsResponse addDetailsResponse;

  AddDetailsSuccessState({required this.addDetailsResponse});
}

class AddDetailsFailureState extends RegisterStates {
  final String error;

  AddDetailsFailureState({required this.error});
}
class UploadImageState extends RegisterStates {}

class UploadFilesLoadingState extends RegisterStates {}

class UploadFilesSuccessState extends RegisterStates {
  final UploadFileResponse uploadFilesResponse;

  UploadFilesSuccessState({required this.uploadFilesResponse});
}

class UploadFilesFailureState extends RegisterStates {
  final String error;

  UploadFilesFailureState({required this.error});
}





import 'dart:io';
import 'package:awfar_captain/features/authentication/data/models/requests/add_details_request_body.dart';
import 'package:awfar_captain/features/authentication/data/models/requests/verify_phone_request_body.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/add_details_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/upload_file_response.dart';
import 'package:awfar_captain/features/authentication/data/models/responses/verify_phone_response.dart';
import 'package:awfar_captain/features/authentication/data/repo/register_repo.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/networking/local/prefs_manager.dart';
import '../../../../core/networking/local/shared_preferences.dart';
import '../../../../core/networking/remote/api_error_handler.dart';
import '../../data/models/requests/register_request_body.dart';
import '../../data/models/responses/register_response.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(InitialRegisterState());

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> detailsFormKey = GlobalKey<FormState>();
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

  void emitRegisterState() async {
    emit(RegisterLoadingState());

    final registerResponse = await _registerRepo.register(
      registerRequestBody:
          RegisterRequestBody(phone: "+2${phoneController.text}"),
    );

    registerResponse.when(
      success: (RegisterResponse registerResponse) {
        emit(RegisterSuccessState(registerResponse: registerResponse));
      },
      failure: (ErrorHandler error) {
        emit(RegisterFailureState(error: error.apiErrorModel.message));
      },
    );
  }

  void emitVerifyPhoneState({required String phone}) async {
    emit(VerifyPhoneLoadingState());

    final registerResponse = await _registerRepo.verifyPhone(
      verifyPhoneRequestBody: VerifyPhoneRequestBody(
        phone: "+2$phone",
        code: otpController.text,
      ),
    );

    registerResponse.when(
      success: (VerifyPhoneResponse verifyPhoneResponse) {
        emit(VerifyPhoneSuccessState(verifyPhoneResponse: verifyPhoneResponse));
      },
      failure: (ErrorHandler error) {
        emit(VerifyPhoneFailureState(error: error.apiErrorModel.message));
      },
    );
  }

  void emitAddDetailsState() async {
    emit(AddDetailsLoadingState());

    print(nameController.text);
    final registerResponse = await _registerRepo.addDetails(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      addDetailsRequestBody: AddDetailsRequestBody(
        email: emailController.text,
        password: passwordController.text,
        password_confirmation: confirmPasswordController.text,
        full_name: nameController.text,
      ),
    );

    registerResponse.when(
      success: (AddDetailsResponse addDetailsResponse) {
        emit(AddDetailsSuccessState(addDetailsResponse: addDetailsResponse));
      },
      failure: (ErrorHandler error) {
        emit(AddDetailsFailureState(error: error.apiErrorModel.message));
      },
    );
  }

  File? image;
  File? idFront;
  File? idBack;
  File? licenseFront;
  File? licenseBack;
  File? carLicenseFront;
  File? carLicenseBack;
  File? criminalRecord;
  File? carFront;
  File? carBack;

  final TextEditingController carBrand = TextEditingController();
  final TextEditingController workArea = TextEditingController();

  Future<void> getImage({required File fileName}) async {
    print('ana hena');
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    fileName = file;
    emit(UploadImageState());
  }

  void emitUploadFiles() async {
    emit(UploadFilesLoadingState());
    FormData data = FormData.fromMap({
      'car_brand': carBrand,
      'work_area': workArea,
    });
    data.files.add(
      MapEntry(
        "image",
        await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "id_front",
        await MultipartFile.fromFile(
          idFront!.path,
          filename: idFront!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "id_back",
        await MultipartFile.fromFile(
          idBack!.path,
          filename: idBack!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "license_front",
        await MultipartFile.fromFile(
          licenseFront!.path,
          filename: licenseFront!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "license_back",
        await MultipartFile.fromFile(
          licenseBack!.path,
          filename: licenseBack!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "car_license_front",
        await MultipartFile.fromFile(
          carLicenseFront!.path,
          filename: carLicenseFront!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "car_license_back",
        await MultipartFile.fromFile(
          carLicenseBack!.path,
          filename: carLicenseFront!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );
    data.files.add(
      MapEntry(
        "criminal_record",
        await MultipartFile.fromFile(
          criminalRecord!.path,
          filename: criminalRecord!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );    data.files.add(
      MapEntry(
        "car_front",
        await MultipartFile.fromFile(
          carFront!.path,
          filename: carFront!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );data.files.add(
      MapEntry(
        "car_back",
        await MultipartFile.fromFile(
          carBack!.path,
          filename: carBack!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );

    final response = await _registerRepo.uploadFiles(
        token: SharedPreferencesManager.getData(key: PrefsManager.token),
        files: data
    );
    response.when(
        success: (UploadFileResponse data) {
          emit(UploadFilesSuccessState(uploadFilesResponse: data));
        },
        failure: (ErrorHandler error) {
          emit(UploadFilesFailureState(error: error.apiErrorModel.message));
        });

  }


}

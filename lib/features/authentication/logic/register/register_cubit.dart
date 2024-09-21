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
      token: SharedPreferencesManager.getSecuredString(PrefsManager.token),
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

  File? profileImage;
  File? idFront;
  File? idBack;
  File? licenseFront;
  File? licenseBack;
  File? carLicenseFront;
  File? carLicenseBack;
  File? criminalRecord;
  File? carFront;
  File? carBack;
  List<String> documents = [
    'الصورة الشخصية',
    ' البطاقة الشخصية (وجه)',
    ' البطاقة الشخصية (ظهر البطاقة)',
    'رخصة القيادة (وجه)',
    'رخصة القيادة (ظهر الرخصة)',
    'رخصة السيارة (وجه)',
    'رخصة السيارة (ظهر)',
    'فيش جنائي',
    'صورة السيارة (من الامام)',
    'صورة السيارة (من الخلف)',
  ];

  final TextEditingController carBrand = TextEditingController();
  final TextEditingController workArea = TextEditingController();

  File? getFile(index) {
    switch (index) {
      case 0:
        return profileImage;
      case 1:
        return idFront;
      case 2:
        return idBack;
      case 3:
        return licenseFront;
      case 4:
        return licenseBack;
      case 5:
        return carLicenseFront;
      case 6:
        return carLicenseBack;
      case 7:
        return criminalRecord;
      case 8:
        return carFront;
      case 9:
        return carBack;
      default:
        return null;
    }
  }

  void pickDocument(index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File? file = File(image!.path);
    switch (index) {
      case 0:
        profileImage = file;
        break;
      case 1:
        idFront = file;
        break;
      case 2:
        idBack = file;
        break;
      case 3:
        licenseFront = file;
        break;
      case 4:
        licenseBack = file;
        break;
      case 5:
        carLicenseFront = file;
        break;
      case 6:
        carLicenseBack = file;
        break;
      case 7:
        criminalRecord = file;
        break;
      case 8:
        carFront = file;
        break;
      case 9:
        carBack = file;
        break;
    }
    emit(UploadImageState());
  }

  void emitUploadFiles() async {
    emit(UploadFilesLoadingState());

    FormData data = FormData.fromMap({
      'car_brand': carBrand.text,
      'work_area': workArea.text,
    });

    data.files.addAll(
      [
        MapEntry(
          "image",
          await MultipartFile.fromFile(
            profileImage!.path,
            filename: profileImage!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "id_front",
          await MultipartFile.fromFile(
            idFront!.path,
            filename: idFront!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "id_back",
          await MultipartFile.fromFile(
            idBack!.path,
            filename: idBack!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "license_front",
          await MultipartFile.fromFile(
            licenseFront!.path,
            filename: licenseFront!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "license_back",
          await MultipartFile.fromFile(
            licenseBack!.path,
            filename: licenseBack!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "car_license_front",
          await MultipartFile.fromFile(
            carLicenseFront!.path,
            filename: carLicenseFront!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "car_license_back",
          await MultipartFile.fromFile(
            carLicenseBack!.path,
            filename: carLicenseFront!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "criminal_record",
          await MultipartFile.fromFile(
            criminalRecord!.path,
            filename: criminalRecord!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "car_front",
          await MultipartFile.fromFile(
            carFront!.path,
            filename: carFront!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
        MapEntry(
          "car_back",
          await MultipartFile.fromFile(
            carBack!.path,
            filename: carBack!.path.split('/').last,
            contentType: MediaType("image", "*"),
          ),
        ),
      ]
    );

    final response = await _registerRepo.uploadFiles(
      token: SharedPreferencesManager.getSecuredString(PrefsManager.token),
      files: data,
    );
    response.when(
      success: (UploadFileResponse data) {
        emit(UploadFilesSuccessState(uploadFilesResponse: data));
      },
      failure: (ErrorHandler error) {
        emit(UploadFilesFailureState(error: error.apiErrorModel.message));
      },
    );
  }
}

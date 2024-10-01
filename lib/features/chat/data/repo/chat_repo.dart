import 'dart:developer';
import 'dart:io';
import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/networking/remote/api_result.dart';
import 'package:awfar_captain/core/networking/remote/services/chat_api_service.dart';
import '../../../../core/networking/remote/api_error_handler.dart';
import '../models/response/get_meassage_response.dart';

class ChatRepo {
  final ChatApiService _chatApiService;
  const ChatRepo(this._chatApiService);

  Future<ApiResult<GetMessageResponse>> getChatDetails() async {
    try {
      final response = await _chatApiService.getMessages(
          token: SharedPreferencesManager.getData(key: PrefsManager.token),
          tripId: '26',
          driverId: '56');

      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(ErrorHandler.handle(e));
    }

    // var res = await DioHelper.postData(
    //     url: ApiEndPoints.provideRoom,
    //     data: {"first_user": firstUser, "second_user": secondUser});
    // GetMessageResponse chatDetailsModel =  GetMessageResponse.fromJson(secondUser);
    // return chatDetailsModel;
  }

  // static sendMessage(
  //     {File? file,
  //       String? content,
  //       required int roomId,
  //       required int? userId,
  //       String type = "TEXT"}) async {
  //   Map<String, dynamic> data = {"user_id": userId, "type": type};
  //
  //   FormData formData = FormData.fromMap(data);
  //
  //   log(formData.fields.toString());
  //
  //   if (content != null) {
  //     formData.fields.add(MapEntry("content", content));
  //   }
  //   if (file != null) {
  //     formData.files.add(
  //       MapEntry(
  //           "file",
  //           await MultipartFile.fromFile(file.path,
  //               filename: file.path.split('/').last)),
  //     );
  //   }
  //
  //   await DioHelper.postData(
  //       url: "${ApiEndPoints.rooms}/$roomId${ApiEndPoints.send}",
  //       data: formData);
  // }
}
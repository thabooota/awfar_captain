// ignore_for_file: constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:awfar_captain/core/networking/remote/api_error_handler.dart';
import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';
import 'package:awfar_captain/features/chat/data/repo/chat_repo.dart';
import 'package:awfar_captain/features/chat/logic/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatCubit extends Cubit<ChatStates> {
  final ChatRepo _chatRepo;

  ChatCubit(this._chatRepo) : super(ChatStateInitial());

  void getChatDetails() async {
    emit(ChatStateLoading());

    final response = await _chatRepo.getChatDetails();

    response.when(
        success: (GetMessageResponse response) {
          print(response.messages[0].message);
          emit(ChatStateSuccess(response));
        },
        failure: (ErrorHandler error) {
          print(error.apiErrorModel.message);
          emit(ChatStateError(error.apiErrorModel.message));
        });
  }

//   void sendMessage(
//       {File? file,
//         String? content,
//         required int roomId,
//         required int? userId,
//         required MESSAGETYPE type}) async {
//     try {
//       emit(state.copyWith(sendMessagesStates: SendMessagesStates.loading));
//
//       await ChatRepo.sendMessage(
//           file: file,
//           content: content,
//           roomId: roomId,
//           userId: userId,
//           type: type.name);
//       emit(state.copyWith(sendMessagesStates: SendMessagesStates.success));
//     } catch (e) {
//       log(e.toString());
//       emit(state.copyWith(
//           exception: e.toString(),
//           sendMessagesStates: SendMessagesStates.failure));
//     }
//   }
}
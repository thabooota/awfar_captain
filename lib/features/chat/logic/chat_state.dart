import 'package:awfar_captain/features/chat/data/models/response/get_meassage_response.dart';

abstract class ChatStates {}

class ChatStateInitial extends ChatStates {}

class ChatStateLoading extends ChatStates {}

class ChatStateSuccess extends ChatStates {
  final GetMessageResponse response;
  ChatStateSuccess(this.response);
}
class ChatStateError extends ChatStates {
  final String errorMessage;
  ChatStateError(this.errorMessage);
}
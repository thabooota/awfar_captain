
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_meassage_response.g.dart';
@JsonSerializable()
class GetMessageResponse {
  final List<Message> messages;
  GetMessageResponse({required this.messages});

  factory GetMessageResponse.fromJson(Map<String, dynamic> json) => _$GetMessageResponseFromJson(json);
}

@JsonSerializable()
class Message {
  final String sender;
  final String receiver;
  final String message;

  Message({required this.sender, required this.receiver, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

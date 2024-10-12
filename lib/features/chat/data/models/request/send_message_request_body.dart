import 'package:json_annotation/json_annotation.dart';
part 'send_message_request_body.g.dart';

@JsonSerializable()
class SendMessageRequestBody {
  final String sender;
  final String message;
  final int client_Id;
  final int driver_Id;
  SendMessageRequestBody({required this.sender, required this.message, required this.client_Id, required this.driver_Id});

  Map<String, dynamic > toJson() => _$SendMessageRequestBodyToJson(this);
}
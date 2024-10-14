import 'package:json_annotation/json_annotation.dart';
part 'send_message_request_body.g.dart';

@JsonSerializable()
class SendMessageRequestBody {
  final String sender;
  final String message;
  final String client_id;
  final String driver_id;
  SendMessageRequestBody({required this.sender, required this.message, required this.client_id, required this.driver_id});

  Map<String, dynamic > toJson() => _$SendMessageRequestBodyToJson(this);
}
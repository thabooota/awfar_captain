import 'package:json_annotation/json_annotation.dart';
part 'send_message_request_body.g.dart';

@JsonSerializable()
class SendMessageRequestBody {
  final String receiver;
  final String message;

  SendMessageRequestBody({required this.receiver, required this.message});

  Map<String, dynamic > toJson() => _$SendMessageRequestBodyToJson(this);
}
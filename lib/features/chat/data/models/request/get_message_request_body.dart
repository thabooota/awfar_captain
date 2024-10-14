import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_message_request_body.g.dart';

@JsonSerializable()
class GetMessagesRequestBody {
  @JsonKey(name: "driver_id")
  final String driverId;
  @JsonKey(name: "client_id")
  final String clientId;

  const GetMessagesRequestBody({
    required this.driverId,
    required this.clientId,
  });

  Map<String, dynamic> toJson() => _$GetMessagesRequestBodyToJson(this);
}
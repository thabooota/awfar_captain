import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_meassage_response.g.dart';

@JsonSerializable()
class GetMessagesResponse {
  @JsonKey(name: "data")
  final List<MessageInfo> messages;

  const GetMessagesResponse({required this.messages});

  factory GetMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesResponseFromJson(json);
}

@JsonSerializable()
class MessageInfo {
  final int? id;
  final String message ,sender;
  @JsonKey(name: "created_at")
  final String? createdAt;

  const MessageInfo({
    this.id,
    required this.sender,
    required this.message,
    this.createdAt,
  });

  factory MessageInfo.fromJson(Map<String, dynamic> json) =>
      _$MessageInfoFromJson(json);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_meassage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessagesResponse _$GetMessagesResponseFromJson(Map<String, dynamic> json) =>
    GetMessagesResponse(
      messages: (json['data'] as List<dynamic>)
          .map((e) => MessageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMessagesResponseToJson(
        GetMessagesResponse instance) =>
    <String, dynamic>{
      'data': instance.messages,
    };

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) => MessageInfo(
      id: (json['id'] as num?)?.toInt(),
      sender: json['sender'] as String,
      message: json['message'] as String,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sender': instance.sender,
      'created_at': instance.createdAt,
    };

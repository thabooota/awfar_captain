// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequestBody _$SendMessageRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SendMessageRequestBody(
      receiver: json['receiver'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SendMessageRequestBodyToJson(
        SendMessageRequestBody instance) =>
    <String, dynamic>{
      'receiver': instance.receiver,
      'message': instance.message,
    };

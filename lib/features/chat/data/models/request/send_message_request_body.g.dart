// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequestBody _$SendMessageRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SendMessageRequestBody(
      sender: json['sender'] as String,
      message: json['message'] as String,
      client_id: json['client_id'] as String,
      driver_id: json['driver_id'] as String,
    );

Map<String, dynamic> _$SendMessageRequestBodyToJson(
        SendMessageRequestBody instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'message': instance.message,
      'client_id': instance.client_id,
      'driver_id': instance.driver_id,
    };

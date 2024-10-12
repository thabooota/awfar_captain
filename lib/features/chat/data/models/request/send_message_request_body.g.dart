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
      client_Id: (json['client_Id'] as num).toInt(),
      driver_Id: (json['driver_Id'] as num).toInt(),
    );

Map<String, dynamic> _$SendMessageRequestBodyToJson(
        SendMessageRequestBody instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'message': instance.message,
      'client_Id': instance.client_Id,
      'driver_Id': instance.driver_Id,
    };

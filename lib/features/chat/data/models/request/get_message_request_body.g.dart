// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessagesRequestBody _$GetMessagesRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetMessagesRequestBody(
      driverId: json['driver_id'] as String,
      clientId: json['client_id'] as String,
    );

Map<String, dynamic> _$GetMessagesRequestBodyToJson(
        GetMessagesRequestBody instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'client_id': instance.clientId,
    };

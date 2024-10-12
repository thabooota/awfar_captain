// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_driver_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusDriverRequestBody _$UpdateStatusDriverRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateStatusDriverRequestBody(
      tripId: (json['tripId'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$UpdateStatusDriverRequestBodyToJson(
        UpdateStatusDriverRequestBody instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'status': instance.status,
    };

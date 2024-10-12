// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_trip_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptOrRejectedTripRequestBody _$AcceptOrRejectedTripRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AcceptOrRejectedTripRequestBody(
      driver_id: (json['driver_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$AcceptOrRejectedTripRequestBodyToJson(
        AcceptOrRejectedTripRequestBody instance) =>
    <String, dynamic>{
      'driver_id': instance.driver_id,
      'id': instance.id,
    };

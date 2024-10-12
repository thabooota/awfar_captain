// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_driver_trip_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDriverTripRequestBody _$StoreDriverTripRequestBodyFromJson(
        Map<String, dynamic> json) =>
    StoreDriverTripRequestBody(
      trip_id: (json['trip_id'] as num).toInt(),
      driver_id: (json['driver_id'] as num).toInt(),
      distance: (json['distance'] as num).toDouble(),
    );

Map<String, dynamic> _$StoreDriverTripRequestBodyToJson(
        StoreDriverTripRequestBody instance) =>
    <String, dynamic>{
      'trip_id': instance.trip_id,
      'driver_id': instance.driver_id,
      'distance': instance.distance,
    };

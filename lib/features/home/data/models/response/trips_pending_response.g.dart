// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_pending_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripsPendingResponse _$TripsPendingResponseFromJson(
        Map<String, dynamic> json) =>
    TripsPendingResponse(
      from_long: json['from_long'] as String,
      from_lat: json['from_lat'] as String,
      trip_id: (json['trip_id'] as num).toInt(),
    );

Map<String, dynamic> _$TripsPendingResponseToJson(
        TripsPendingResponse instance) =>
    <String, dynamic>{
      'from_long': instance.from_long,
      'from_lat': instance.from_lat,
      'trip_id': instance.trip_id,
    };

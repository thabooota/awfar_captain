// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTripResponse _$GetTripResponseFromJson(Map<String, dynamic> json) =>
    GetTripResponse(
      tripInfo: TripInfo.fromJson(json['body'] as Map<String, dynamic>),
      title: json['title'] as String,
    );

Map<String, dynamic> _$GetTripResponseToJson(GetTripResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.tripInfo,
    };

TripInfo _$TripInfoFromJson(Map<String, dynamic> json) => TripInfo(
      from_lat: json['from_lat'] as String,
      to_lat: json['to_lat'] as String,
      trip_di: json['trip_di'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      from_long: json['from_long'] as String,
      to_long: json['to_long'] as String,
      coupon: json['coupon'] as String,
    );

Map<String, dynamic> _$TripInfoToJson(TripInfo instance) => <String, dynamic>{
      'trip_di': instance.trip_di,
      'from': instance.from,
      'to': instance.to,
      'from_long': instance.from_long,
      'to_long': instance.to_long,
      'from_lat': instance.from_lat,
      'to_lat': instance.to_lat,
      'coupon': instance.coupon,
    };

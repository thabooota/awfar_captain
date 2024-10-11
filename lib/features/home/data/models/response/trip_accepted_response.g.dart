// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_accepted_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripAcceptedResponse _$TripAcceptedResponseFromJson(
        Map<String, dynamic> json) =>
    TripAcceptedResponse(
      Client: ClintInfo.fromJson(json['Client'] as Map<String, dynamic>),
      To: json['To'] as String,
      From: json['From'] as String,
      Price: (json['Price'] as num).toInt(),
      TripID: (json['TripID'] as num).toInt(),
      From_lat: json['From_lat'] as String,
      To_lat: json['To_lat'] as String,
      From_long: json['From_long'] as String,
      To_long: json['To_long'] as String,
    );

Map<String, dynamic> _$TripAcceptedResponseToJson(
        TripAcceptedResponse instance) =>
    <String, dynamic>{
      'TripID': instance.TripID,
      'To': instance.To,
      'From': instance.From,
      'Price': instance.Price,
      'From_long': instance.From_long,
      'To_long': instance.To_long,
      'To_lat': instance.To_lat,
      'From_lat': instance.From_lat,
      'Client': instance.Client,
    };

ClintInfo _$ClintInfoFromJson(Map<String, dynamic> json) => ClintInfo(
      name: json['Full Name'] as String,
      Phone: json['Phone'] as String,
    );

Map<String, dynamic> _$ClintInfoToJson(ClintInfo instance) => <String, dynamic>{
      'Full Name': instance.name,
      'Phone': instance.Phone,
    };

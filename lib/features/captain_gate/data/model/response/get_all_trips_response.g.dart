// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_trips_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTripsResponse _$GetAllTripsResponseFromJson(Map<String, dynamic> json) =>
    GetAllTripsResponse(
      allTrips: (json['data'] as List<dynamic>)
          .map((e) => TripData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllTripsResponseToJson(
        GetAllTripsResponse instance) =>
    <String, dynamic>{
      'data': instance.allTrips,
    };

TripData _$TripDataFromJson(Map<String, dynamic> json) => TripData(
      id: (json['id'] as num).toInt(),
      from: json['from'] as String,
      to: json['to'] as String,
      rate: json['rate'] as String?,
      price: (json['price'] as num).toInt(),
      clientInfo: ClientInfo.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TripDataToJson(TripData instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'rate': instance.rate,
      'price': instance.price,
      'client': instance.clientInfo,
    };

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) => ClientInfo(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ClientInfoToJson(ClientInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

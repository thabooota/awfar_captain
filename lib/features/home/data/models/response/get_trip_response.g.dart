// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTripResponse _$GetTripResponseFromJson(Map<String, dynamic> json) =>
    GetTripResponse(
      tripInfo: TripData.fromJson(json['data'] as Map<String, dynamic>),
      clientInfo: ClientData.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTripResponseToJson(GetTripResponse instance) =>
    <String, dynamic>{
      'data': instance.tripInfo,
      'client': instance.clientInfo,
    };

TripData _$TripDataFromJson(Map<String, dynamic> json) => TripData(
      typeTrip: TypeTrip.fromJson(json['type_trip'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      from: json['from'] as String,
      to: json['to'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$TripDataToJson(TripData instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'type_trip': instance.typeTrip,
      'price': instance.price,
    };

TypeTrip _$TypeTripFromJson(Map<String, dynamic> json) => TypeTrip(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeTripToJson(TypeTrip instance) => <String, dynamic>{
      'name': instance.name,
    };

ClientData _$ClientDataFromJson(Map<String, dynamic> json) => ClientData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClientDataToJson(ClientData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
    };

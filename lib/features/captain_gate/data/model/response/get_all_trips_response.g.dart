// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_trips_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTripsResponse _$GetTripsResponseFromJson(Map<String, dynamic> json) =>
    GetTripsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTripsResponseToJson(GetTripsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: (json['id'] as num).toInt(),
      tripNumber: json['trip_number'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      status: json['status'] as String,
      price: (json['price'] as num).toDouble(),
      rate: (json['rate'] as num?)?.toInt(),
      startAt: json['start_at'] as String?,
      endAt: json['end_at'] as String?,
      tripType: TripType.fromJson(json['type_trip'] as Map<String, dynamic>),
      totalPrice: (json['total_price'] as num).toDouble(),
      coupon: (json['coupon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'trip_number': instance.tripNumber,
      'from': instance.from,
      'to': instance.to,
      'status': instance.status,
      'coupon': instance.coupon,
      'price': instance.price,
      'rate': instance.rate,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'total_price': instance.totalPrice,
      'type_trip': instance.tripType,
    };

TripType _$TripTypeFromJson(Map<String, dynamic> json) => TripType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TripTypeToJson(TripType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      path: json['path'] as String,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'path': instance.path,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_routes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoutesResponse _$GetRoutesResponseFromJson(Map<String, dynamic> json) =>
    GetRoutesResponse(
      routes: (json['routes'] as List<dynamic>)
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRoutesResponseToJson(GetRoutesResponse instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      distanceMeters: (json['distanceMeters'] as num).toDouble(),
      duration: json['duration'] as String,
      polyline: PolylineData.fromJson(json['polyline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'distanceMeters': instance.distanceMeters,
      'duration': instance.duration,
      'polyline': instance.polyline,
    };

PolylineData _$PolylineDataFromJson(Map<String, dynamic> json) => PolylineData(
      encodedPolyline: json['encodedPolyline'] as String,
    );

Map<String, dynamic> _$PolylineDataToJson(PolylineData instance) =>
    <String, dynamic>{
      'encodedPolyline': instance.encodedPolyline,
    };

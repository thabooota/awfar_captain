// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_routes_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoutesRequestBody _$GetRoutesRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetRoutesRequestBody(
      origin: LocationInfo.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          LocationInfo.fromJson(json['destination'] as Map<String, dynamic>),
      travelMode: json['travelMode'] as String? ?? "DRIVE",
      routingPreference:
          json['routingPreference'] as String? ?? "TRAFFIC_AWARE",
      languageCode: json['languageCode'] as String? ?? "ar-EG",
      units: json['units'] as String? ?? "IMPERIAL",
      computeAlternativeRoutes:
          json['computeAlternativeRoutes'] as bool? ?? false,
      routeModifiers: RouteModifiers.fromJson(
          json['routeModifiers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRoutesRequestBodyToJson(
        GetRoutesRequestBody instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'travelMode': instance.travelMode,
      'routingPreference': instance.routingPreference,
      'languageCode': instance.languageCode,
      'units': instance.units,
      'computeAlternativeRoutes': instance.computeAlternativeRoutes,
      'routeModifiers': instance.routeModifiers,
    };

LocationInfo _$LocationInfoFromJson(Map<String, dynamic> json) => LocationInfo(
      location:
          LocationInfoData.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationInfoToJson(LocationInfo instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

LocationInfoData _$LocationInfoDataFromJson(Map<String, dynamic> json) =>
    LocationInfoData(
      latLng: LatLngInfo.fromJson(json['latLng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationInfoDataToJson(LocationInfoData instance) =>
    <String, dynamic>{
      'latLng': instance.latLng,
    };

LatLngInfo _$LatLngInfoFromJson(Map<String, dynamic> json) => LatLngInfo(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngInfoToJson(LatLngInfo instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

RouteModifiers _$RouteModifiersFromJson(Map<String, dynamic> json) =>
    RouteModifiers(
      avoidTolls: json['avoidTolls'] as bool? ?? false,
      avoidHighways: json['avoidHighways'] as bool? ?? false,
      avoidFerries: json['avoidFerries'] as bool? ?? false,
    );

Map<String, dynamic> _$RouteModifiersToJson(RouteModifiers instance) =>
    <String, dynamic>{
      'avoidTolls': instance.avoidTolls,
      'avoidHighways': instance.avoidHighways,
      'avoidFerries': instance.avoidFerries,
    };

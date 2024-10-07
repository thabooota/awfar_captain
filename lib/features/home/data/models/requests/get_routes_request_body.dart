import 'package:json_annotation/json_annotation.dart';

part 'get_routes_request_body.g.dart';

@JsonSerializable()
class GetRoutesRequestBody {
  final LocationInfo origin;
  final LocationInfo destination;
  final String travelMode, routingPreference, languageCode, units;
  final bool computeAlternativeRoutes;
  final RouteModifiers routeModifiers;

  const GetRoutesRequestBody({
    required this.origin,
    required this.destination,
    this.travelMode = "DRIVE",
    this.routingPreference = "TRAFFIC_AWARE",
    this.languageCode = "ar-EG",
    this.units = "IMPERIAL",
    this.computeAlternativeRoutes = false,
    required this.routeModifiers,
  });

  Map<String, dynamic> toJson() => _$GetRoutesRequestBodyToJson(this);
}

@JsonSerializable()
class LocationInfo {
  final LocationInfoData location;

  const LocationInfo({required this.location});

  Map<String, dynamic> toJson() => _$LocationInfoToJson(this);

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);
}

@JsonSerializable()
class LocationInfoData {
  final LatLngInfo latLng;

  const LocationInfoData({required this.latLng});

  factory LocationInfoData.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationInfoDataToJson(this);
}

@JsonSerializable()
class LatLngInfo {
  final double latitude, longitude;

  const LatLngInfo({required this.latitude, required this.longitude});

  factory LatLngInfo.fromJson(Map<String, dynamic> json) =>
      _$LatLngInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngInfoToJson(this);
}

@JsonSerializable()
class RouteModifiers {
  final bool avoidTolls, avoidHighways, avoidFerries;

  const RouteModifiers({
    this.avoidTolls = false,
    this.avoidHighways = false,
    this.avoidFerries = false,
  });

  factory RouteModifiers.fromJson(Map<String, dynamic> json) =>
      _$RouteModifiersFromJson(json);

  Map<String, dynamic> toJson() => _$RouteModifiersToJson(this);
}
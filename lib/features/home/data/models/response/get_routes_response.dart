import 'package:json_annotation/json_annotation.dart';

part 'get_routes_response.g.dart';

@JsonSerializable()
class GetRoutesResponse {
  final List<Route> routes;

  const GetRoutesResponse({required this.routes});

  factory GetRoutesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoutesResponseFromJson(json);
}

@JsonSerializable()
class Route {
  final double distanceMeters;
  final String duration;
  final PolylineData polyline;

  const Route(
      {required this.distanceMeters,
        required this.duration,
        required this.polyline});

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

@JsonSerializable()
class PolylineData {
  final String encodedPolyline;

  const PolylineData({required this.encodedPolyline});

  factory PolylineData.fromJson(Map<String, dynamic> json) =>
      _$PolylineDataFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';

part 'get_routes_response.g.dart';

@JsonSerializable()
class GetRoutesResponse {
  final List<Routes> routes;

  const GetRoutesResponse({required this.routes});

  factory GetRoutesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoutesResponseFromJson(json);
}

@JsonSerializable()
class Routes {
  final double distanceMeters;
  final String duration;
  final PolylineData polyline;

  const Routes(
      {required this.distanceMeters,
        required this.duration,
        required this.polyline});

  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);
}

@JsonSerializable()
class PolylineData {
  final String encodedPolyline;

  const PolylineData({required this.encodedPolyline});

  factory PolylineData.fromJson(Map<String, dynamic> json) =>
      _$PolylineDataFromJson(json);
}
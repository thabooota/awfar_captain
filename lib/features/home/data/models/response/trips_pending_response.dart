import 'package:json_annotation/json_annotation.dart';
part 'trips_pending_response.g.dart';

@JsonSerializable()
class TripsPendingResponse {
  final String from_long;
  final String from_lat;
  final int trip_id;

  TripsPendingResponse({
    required this.from_long,
    required this.from_lat,
    required this.trip_id,
  });

  factory TripsPendingResponse.fromJson(Map<String, dynamic> json) => _$TripsPendingResponseFromJson(json);
}
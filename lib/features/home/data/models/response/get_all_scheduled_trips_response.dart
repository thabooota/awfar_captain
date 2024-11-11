import 'package:json_annotation/json_annotation.dart';
part 'get_all_scheduled_trips_response.g.dart';
@JsonSerializable()
class GetAllScheduledTripsResponse {
  final int trip_id;
  final String from;
  final String to;
  final String status;
  final int price;
  final String time;
  final String date;
  final String from_long;
  final String from_lat;
  final String to_long;
  final String to_lat;
  @JsonKey(name: "Client")
  final Client client;

  GetAllScheduledTripsResponse({
    required this.client,
    required this.trip_id,
    required this.from,
    required this.to,
    required this.status,
    required this.price,
    required this.time,
    required this.date,
    required this.from_long,
    required this.from_lat,
    required this.to_long,
    required this.to_lat,
  });
  factory GetAllScheduledTripsResponse.fromJson(Map<String, dynamic> json) => _$GetAllScheduledTripsResponseFromJson(json);
}

@JsonSerializable()
class Client {
  @JsonKey(name: "Full Name")
  final String name;
  final String Phone;
  final int Client_id;

  Client({required this.name, required this.Phone, required this.Client_id});
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

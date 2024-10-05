import 'package:json_annotation/json_annotation.dart';
part 'get_all_trips_response.g.dart';
@JsonSerializable()
class GetAllTripsResponse {
  @JsonKey(name: 'data')
  final List<TripData> allTrips;

  GetAllTripsResponse({required this.allTrips});

  factory GetAllTripsResponse.fromJson(Map<String, dynamic> json) => _$GetAllTripsResponseFromJson(json);

}

@JsonSerializable()
class TripData {
  final int id;
  final String from;
  final String to;
  final String ?rate;
  final int price;
  @JsonKey(name: 'client')
  final ClientInfo clientInfo;

  TripData({required this.id, required this.from, required this.to, required this.rate, required this.price, required this.clientInfo});

  factory TripData.fromJson(Map<String, dynamic> json) => _$TripDataFromJson(json);
}

@JsonSerializable()
class ClientInfo {
  final String name;

  ClientInfo({required this.name});

  factory ClientInfo.fromJson(Map<String, dynamic> json) => _$ClientInfoFromJson(json);
}
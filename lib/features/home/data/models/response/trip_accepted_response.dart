import 'package:json_annotation/json_annotation.dart';
part 'trip_accepted_response.g.dart';

@JsonSerializable()
class TripAcceptedResponse {
  final int TripID;
  final String To;
  final String From;
  final int Price;
  final String From_long;
  final String To_long;
  final String To_lat;
  final String From_lat;

  final ClintInfo Client;

  TripAcceptedResponse({required this.Client, required this.To, required this.From, required this.Price, required this.TripID, required this.From_lat, required this.To_lat, required this.From_long, required this.To_long});

  factory TripAcceptedResponse.fromJson(Map<String, dynamic> json) => _$TripAcceptedResponseFromJson(json);
}

@JsonSerializable()
class ClintInfo {
  @JsonKey(name: "Full Name")
  final String name;
  final String Phone;

  ClintInfo({required this.name, required this.Phone});

  factory ClintInfo.fromJson(Map<String, dynamic> json) => _$ClintInfoFromJson(json);

}
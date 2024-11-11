import 'package:json_annotation/json_annotation.dart';
part 'trip_accepted_response.g.dart';

@JsonSerializable()
class TripAcceptedResponse {
  final int ?TripID;
  final String ?To;
  final String ?From;
  final int ?Price;
  final String ?From_long;
  final String ?To_long;
  final String ?To_lat;
  final String ?From_lat;
  final String ?data;
  final String ?message;
  final ClintInfo ?Client;

  TripAcceptedResponse({
    this.Client,
    this.To,
    this.From,
    this.Price,
    this.TripID,
    this.From_lat,
    this.To_lat,
    this.From_long,
    this.To_long,
    this.data,
    this.message
  });

  factory TripAcceptedResponse.fromJson(Map<String, dynamic> json) => _$TripAcceptedResponseFromJson(json);
}

@JsonSerializable()
class ClintInfo {
  @JsonKey(name: "Full Name")
  final String name;
  final String Phone;
  final int Client_id;

  ClintInfo({required this.Client_id, required this.name, required this.Phone});

  factory ClintInfo.fromJson(Map<String, dynamic> json) => _$ClintInfoFromJson(json);

}
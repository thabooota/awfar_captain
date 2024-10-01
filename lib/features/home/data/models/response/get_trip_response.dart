import 'package:json_annotation/json_annotation.dart';
part 'get_trip_response.g.dart';
@JsonSerializable()
class GetTripResponse {
  @JsonKey(name: 'data')
  final TripData tripInfo;
  @JsonKey(name: 'client')
  final ClientData clientInfo;

  GetTripResponse({
    required this.tripInfo,
    required this.clientInfo,
  });

  factory GetTripResponse.fromJson(Map<String, dynamic> json) => _$GetTripResponseFromJson(json);
}

@JsonSerializable()
class TripData {
  final int id;
  final String from;
  final String to;
  @JsonKey(name: 'type_trip')
  final TypeTrip typeTrip;
  final int price;

  TripData( {required this.typeTrip,required this.id, required this.from, required this.to, required this.price});

  factory TripData.fromJson(Map<String, dynamic> json) => _$TripDataFromJson(json);
}

@JsonSerializable()
class TypeTrip {
  final String name;
  TypeTrip({required this.name});
  factory TypeTrip.fromJson(Map<String, dynamic> json) => _$TypeTripFromJson(json);
}

@JsonSerializable()
class ClientData {
  final int id;
  final String ?name;
  final List<Media>? media;
  ClientData({
    required this.id,
    this.name,
    this.media,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) => _$ClientDataFromJson(json);
}

@JsonSerializable()
class Media {
  final int id;
  final String name;
  final String path;

  Media({required this.id, required this.name, required this.path});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

}
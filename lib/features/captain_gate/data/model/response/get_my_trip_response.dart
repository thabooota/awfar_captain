import 'package:json_annotation/json_annotation.dart';
part 'get_my_trip_response.g.dart';

@JsonSerializable()
class GetMyTripResponse{

  final List<MyTrip> myTrips;

  GetMyTripResponse({required this.myTrips});

  factory GetMyTripResponse.fromJson(Map<String, dynamic> json) => _$GetMyTripResponseFromJson(json);
}
@JsonSerializable()
class MyTrip{
  @JsonKey(name: 'data')
  final TripData tripInfo;
  @JsonKey(name: 'client')
  final ClientData clientInfo;

  MyTrip({
    required this.tripInfo,
    required this.clientInfo,
  });

  factory MyTrip.fromJson(Map<String, dynamic> json) => _$MyTripFromJson(json);
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
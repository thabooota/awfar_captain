import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_trips_response.g.dart';

@JsonSerializable()
class GetTripsResponse {
  final List<Trip> data;

  const GetTripsResponse({required this.data});

  factory GetTripsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTripsResponseFromJson(json);
}

@JsonSerializable()
class Trip {
  final int id;
  @JsonKey(name: "trip_number")
  final String tripNumber;
  final String from, to, status;
  final double? coupon;
  final double price;
  final int? rate;
  @JsonKey(name: "start_at")
  final String? startAt;
  @JsonKey(name: "end_at")
  final String? endAt;
  @JsonKey(name: "total_price")
  final double totalPrice;
  @JsonKey(name: "type_trip")
  final TripType tripType;

  const Trip({
    required this.id,
    required this.tripNumber,
    required this.from,
    required this.to,
    required this.status,
    required this.price,
    required this.rate,
    required this.startAt,
    required this.endAt,
    required this.tripType,
    required this.totalPrice,
    required this.coupon,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}

@JsonSerializable()
class TripType {
  final int id;
  final String name, description;
  final double price;
  final List<Media> media;

  const TripType({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.media,
  });

  factory TripType.fromJson(Map<String, dynamic> json) =>
      _$TripTypeFromJson(json);
}

@JsonSerializable()
class Media {
  final String path;

  const Media({required this.path});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';
part 'get_trip_response.g.dart';
@JsonSerializable()
class GetTripResponse {
  final String title;
  @JsonKey(name: 'body')
  final TripInfo tripInfo;

  GetTripResponse({
    required this.tripInfo,
    required this.title,
  });

  factory GetTripResponse.fromJson(Map<String, dynamic> json) => _$GetTripResponseFromJson(json);
}

@JsonSerializable()
class TripInfo {
  final String trip_di;
  final String from;
  final String to;
  final String from_long;
  final String to_long;
  final String from_lat;
  final String to_lat;
  final String coupon;

  TripInfo({
    required this.from_lat,
    required this.to_lat,
    required this.trip_di,
    required this.from,
    required this.to,
    required this.from_long,
    required this.to_long,
    required this.coupon
  });

  factory TripInfo.fromJson(Map<String, dynamic> json) => _$TripInfoFromJson(json);

}
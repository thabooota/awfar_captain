import 'package:json_annotation/json_annotation.dart';
part 'store_driver_trip_request_body.g.dart';
@JsonSerializable()
class StoreDriverTripRequestBody {
  final int trip_id;
  final int driver_id;
  final double distance;

  StoreDriverTripRequestBody({required this.trip_id, required this.driver_id, required this.distance});

  Map<String, dynamic> toJson() => _$StoreDriverTripRequestBodyToJson(this);
}
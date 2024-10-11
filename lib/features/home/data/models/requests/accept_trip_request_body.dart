import 'package:json_annotation/json_annotation.dart';
part 'accept_trip_request_body.g.dart';

@JsonSerializable()
class AcceptOrRejectedTripRequestBody {
  final int driver_id;
  final int id;
  AcceptOrRejectedTripRequestBody({ required this.driver_id, required this.id});

  Map<String, dynamic> toJson() => _$AcceptOrRejectedTripRequestBodyToJson(this);

}
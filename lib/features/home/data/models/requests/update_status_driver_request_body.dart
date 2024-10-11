import 'package:json_annotation/json_annotation.dart';
part 'update_status_driver_request_body.g.dart';
@JsonSerializable()
class UpdateStatusDriverRequestBody {
  final int tripId;
  final String status;

  UpdateStatusDriverRequestBody({required this.tripId, required this.status});

  Map<String, dynamic> toJson() => _$UpdateStatusDriverRequestBodyToJson(this);
}
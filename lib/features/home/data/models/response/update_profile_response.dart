
import 'package:json_annotation/json_annotation.dart';
part 'update_profile_response.g.dart';
@JsonSerializable()
class UpdateProfileResponse {
  final String message;
  UpdateProfileResponse({required this.message});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => _$UpdateProfileResponseFromJson(json);
}
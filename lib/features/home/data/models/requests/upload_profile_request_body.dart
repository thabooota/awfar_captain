import 'package:json_annotation/json_annotation.dart';
part 'upload_profile_request_body.g.dart';
@JsonSerializable()
class UpdateProfileRequestBody {
  final String name;
  final String email;
  final String phone;
  final String address;
  @JsonKey(name: 'work_area')
  final String workArea;

  UpdateProfileRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.workArea,
});
  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
}

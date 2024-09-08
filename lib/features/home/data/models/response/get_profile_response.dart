import 'package:json_annotation/json_annotation.dart';
part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
  final String message;
  @JsonKey(name: 'data')
  final ProfileInfo profileInfo;

  GetProfileResponse({required this.message, required this.profileInfo});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) => _$GetProfileResponseFromJson(json);
}

@JsonSerializable()
class ProfileInfo {
  final int id;
  @JsonKey(name: 'full_name')
  final String name;
  final String email;
  final String phone;
  final String ?address;
  @JsonKey(name: 'work_area')
  final String ?workArea;
  @JsonKey(name: 'car_brand')
  final String ?carBrand;
  @JsonKey(name: 'car_color')
  final String ?carColor;
  @JsonKey(name: 'car_model')
  final String ?carModel;

  ProfileInfo(this.address, this.workArea, {required this.id, required this.name, required this.email, required this.phone,  this.carBrand,  this.carColor,  this.carModel});

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => _$ProfileInfoFromJson(json);
}
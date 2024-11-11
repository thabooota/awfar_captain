import 'package:json_annotation/json_annotation.dart';
part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
  final String message;
  final bool status;
  final int ?rate;
  @JsonKey(name: 'data')
  final ProfileInfo profileInfo;

  GetProfileResponse(
      {required this.message, required this.profileInfo, required this.status,this.rate});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}

@JsonSerializable()
class ProfileInfo {
  final int id;
  @JsonKey(name: 'full_name')
  final String name;
  final String email;
  final String phone;
  final String? address;
  final String? is_active;
  @JsonKey(name: 'work_area')
  final String? workArea;
  @JsonKey(name: 'car_brand')
  final String? carBrand;
  @JsonKey(name: 'car_color')
  final String? carColor;
  @JsonKey(name: 'car_model')
  final String? carModel;
  final List<Media>? media;

  ProfileInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.carBrand,
    this.is_active,
    this.carColor,
    this.carModel,
    this.address,
    this.workArea,
    this.media,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoFromJson(json);
}

@JsonSerializable()
class Media {
  final int id;
  final String name;
  final String path;

  Media({required this.id, required this.name, required this.path});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

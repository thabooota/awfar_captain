// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) =>
    GetProfileResponse(
      message: json['message'] as String,
      profileInfo: ProfileInfo.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      rate: (json['rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProfileResponseToJson(GetProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'rate': instance.rate,
      'data': instance.profileInfo,
    };

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) => ProfileInfo(
      id: (json['id'] as num).toInt(),
      name: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      carBrand: json['car_brand'] as String?,
      is_active: json['is_active'] as String?,
      carColor: json['car_color'] as String?,
      carModel: json['car_model'] as String?,
      address: json['address'] as String?,
      workArea: json['work_area'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'is_active': instance.is_active,
      'work_area': instance.workArea,
      'car_brand': instance.carBrand,
      'car_color': instance.carColor,
      'car_model': instance.carModel,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
    };

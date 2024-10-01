// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestBody(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      workArea: json['work_area'] as String,
    );

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
        UpdateProfileRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'work_area': instance.workArea,
    };

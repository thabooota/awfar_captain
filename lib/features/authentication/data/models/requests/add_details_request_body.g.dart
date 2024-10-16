// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_details_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDetailsRequestBody _$AddDetailsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddDetailsRequestBody(
      full_name: json['full_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      password_confirmation: json['password_confirmation'] as String,
      car_model: json['car_model'] as String,
      car_brand: json['car_brand'] as String,
      car_color: json['car_color'] as String,
      car_number: json['car_number'] as String,
    );

Map<String, dynamic> _$AddDetailsRequestBodyToJson(
        AddDetailsRequestBody instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
      'car_number': instance.car_number,
      'car_model': instance.car_model,
      'car_brand': instance.car_brand,
      'car_color': instance.car_color,
    };

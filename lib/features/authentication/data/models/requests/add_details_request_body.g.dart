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
    );

Map<String, dynamic> _$AddDetailsRequestBodyToJson(
        AddDetailsRequestBody instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
    };

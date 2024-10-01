// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestBody _$ResetPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequestBody(
      phone: json['phone'] as String,
      password: json['new_password'] as String,
      passwordConfirmation: json['new_password_confirmation'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestBodyToJson(
        ResetPasswordRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'new_password': instance.password,
      'new_password_confirmation': instance.passwordConfirmation,
    };

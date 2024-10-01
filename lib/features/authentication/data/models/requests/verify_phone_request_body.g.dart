// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneRequestBody _$VerifyPhoneRequestBodyFromJson(
        Map<String, dynamic> json) =>
    VerifyPhoneRequestBody(
      phone: json['phone'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyPhoneRequestBodyToJson(
        VerifyPhoneRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };

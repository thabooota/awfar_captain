// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_code_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCodeRequestBody _$CheckCodeRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CheckCodeRequestBody(
      phone: json['phone'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CheckCodeRequestBodyToJson(
        CheckCodeRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };

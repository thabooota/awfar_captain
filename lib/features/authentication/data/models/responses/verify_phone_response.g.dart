// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneResponse _$VerifyPhoneResponseFromJson(Map<String, dynamic> json) =>
    VerifyPhoneResponse(
      message: json['message'] as String,
      code: json['code'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$VerifyPhoneResponseToJson(
        VerifyPhoneResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'token': instance.token,
    };

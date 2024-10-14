// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_client_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateClientRequestBody _$RateClientRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RateClientRequestBody(
      rate: json['rate'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$RateClientRequestBodyToJson(
        RateClientRequestBody instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'comment': instance.comment,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyBalanceResponse _$GetMyBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    GetMyBalanceResponse(
      balance: Balance.fromJson(json['balance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMyBalanceResponseToJson(
        GetMyBalanceResponse instance) =>
    <String, dynamic>{
      'balance': instance.balance,
    };

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      id: (json['id'] as num).toInt(),
      balance: json['balance'] as String,
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
    };

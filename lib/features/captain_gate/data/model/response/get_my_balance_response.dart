
import 'package:json_annotation/json_annotation.dart';
part 'get_my_balance_response.g.dart';
@JsonSerializable()
class GetMyBalanceResponse {
  final Balance balance;
  GetMyBalanceResponse({required this.balance});

  factory GetMyBalanceResponse.fromJson(Map<String, dynamic> json) => _$GetMyBalanceResponseFromJson(json);
}

@JsonSerializable()
class Balance {
  final int id;
  final String balance;

  Balance({required this.id, required this.balance});

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';
part 'verify_phone_response.g.dart';
@JsonSerializable()
class VerifyPhoneResponse {
  final String message;
  final String code;
  final String token;
  VerifyPhoneResponse({required this.message, required this.code, required this.token});

  factory VerifyPhoneResponse.fromJson(Map<String, dynamic> json) => _$VerifyPhoneResponseFromJson(json);
}
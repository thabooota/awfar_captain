import 'package:json_annotation/json_annotation.dart';
part 'verify_phone_request_body.g.dart';
@JsonSerializable()
class VerifyPhoneRequestBody {
  final String phone;
  final String code;

  VerifyPhoneRequestBody({required this.phone, required this.code});

  Map<String, dynamic> toJson() => _$VerifyPhoneRequestBodyToJson(this);
}
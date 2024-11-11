import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';
@JsonSerializable()
class LoginRequestBody {
  final String phone;
  final String password;
  @JsonKey(name: 'device_id')
  final String fcmToken;

  LoginRequestBody({
    required this.phone,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';
@JsonSerializable()
class RegisterRequestBody {
  final String phone;
  @JsonKey(name: 'app_device')
  final String fcmToken;

  RegisterRequestBody({required this.phone, required this.fcmToken});

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
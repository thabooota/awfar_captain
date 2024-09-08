import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_body.g.dart';

@JsonSerializable()
class ResetPasswordRequestBody {
  final String phone;
  @JsonKey(name: "new_password")
  final String password;
  @JsonKey(name: "new_password_confirmation")
  final String passwordConfirmation;

  const ResetPasswordRequestBody({
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordRequestBodyToJson(this);
}

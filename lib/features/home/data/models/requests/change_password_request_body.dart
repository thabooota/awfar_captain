import 'package:json_annotation/json_annotation.dart';
part 'change_password_request_body.g.dart';
@JsonSerializable()
class ChangePasswordRequestBody {
  final String old_password;
  final String new_password;
  final String new_password_confirmation;

  ChangePasswordRequestBody({required this.old_password, required this.new_password, required this.new_password_confirmation});

  Map<String, dynamic> toMap() => _$ChangePasswordRequestBodyToJson(this);
}
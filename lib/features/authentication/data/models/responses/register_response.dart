import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse {
  String? message;
  int? code;

  RegisterResponse(this.message, this.code);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
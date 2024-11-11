import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';
@JsonSerializable()
class RegisterRequestBody {
  final String phone;
  final String device_id;

  RegisterRequestBody({required this.device_id, required this.phone,});

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
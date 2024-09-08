import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';
@JsonSerializable()
class RegisterRequestBody {
  String? phone;

  RegisterRequestBody({required this.phone});

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
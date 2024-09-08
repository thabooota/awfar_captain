import 'package:json_annotation/json_annotation.dart';

part 'check_code_request_body.g.dart';

@JsonSerializable()
class CheckCodeRequestBody {
  final String phone, code;

  const CheckCodeRequestBody({required this.phone, required this.code});

  Map<String, dynamic> toJson() => _$CheckCodeRequestBodyToJson(this);
}

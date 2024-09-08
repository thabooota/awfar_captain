import 'package:json_annotation/json_annotation.dart';

part 'check_code_response.g.dart';

@JsonSerializable()
class CheckCodeResponse {
  final String message;

  const CheckCodeResponse({required this.message});

  factory CheckCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckCodeResponseFromJson(json);
}


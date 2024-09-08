import 'package:json_annotation/json_annotation.dart';
part 'add_details_request_body.g.dart';
@JsonSerializable()
class AddDetailsRequestBody {
  // @JsonKey(name: 'full_name')
  final String full_name;
  final String email;
  final String password;
  // @JsonKey(name: 'password_confirmation')
  final String password_confirmation;

  AddDetailsRequestBody({
    required this.full_name,
    required this.email,
    required this.password,
    required this.password_confirmation,

});
 Map <String , dynamic> toJson() => _$AddDetailsRequestBodyToJson(this);
}
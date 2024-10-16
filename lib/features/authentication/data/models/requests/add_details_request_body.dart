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
  final String car_number;
  final String car_model;
  final String car_brand;
  final String car_color;

  AddDetailsRequestBody({
    required this.full_name,
    required this.email,
    required this.password,
    required this.password_confirmation,
    required this.car_model,
    required this.car_brand,
    required this.car_color,
    required this.car_number,

});
 Map <String , dynamic> toJson() => _$AddDetailsRequestBodyToJson(this);
}
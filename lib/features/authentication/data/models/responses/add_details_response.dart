import 'package:json_annotation/json_annotation.dart';
part 'add_details_response.g.dart';
@JsonSerializable()
class AddDetailsResponse {
  final String? message;

  AddDetailsResponse({
    this.message,
  });
  factory AddDetailsResponse.fromJson(Map<String, dynamic> json) => _$AddDetailsResponseFromJson(json);
}
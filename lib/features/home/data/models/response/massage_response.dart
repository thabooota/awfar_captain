
import 'package:json_annotation/json_annotation.dart';
part 'massage_response.g.dart';
@JsonSerializable()
class MassageResponse {
 final String message;

 MassageResponse({required this.message});

 factory MassageResponse.fromJson(Map<String, dynamic> json) => _$MassageResponseFromJson(json);
}
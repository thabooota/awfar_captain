import 'package:json_annotation/json_annotation.dart';
part 'get_all_notifications_response.g.dart';
@JsonSerializable()
class GetAllNotificationsResponse {
  final String title;
  final String body;

  GetAllNotificationsResponse({required this.title, required this.body});

  factory GetAllNotificationsResponse.fromJson(Map<String, dynamic> json) => _$GetAllNotificationsResponseFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';
part 'get_about_privacy_response.g.dart';
@JsonSerializable()
class GetAboutPrivacyResponse {
  final int id;
  final String privacy;
  final String about;
  GetAboutPrivacyResponse({
    required this.id,
    required this.privacy,
    required this.about,
  });

  factory GetAboutPrivacyResponse.fromJson(Map<String, dynamic> json) => _$GetAboutPrivacyResponseFromJson(json);
}
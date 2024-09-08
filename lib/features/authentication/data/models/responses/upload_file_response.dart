import 'package:json_annotation/json_annotation.dart';
part 'upload_file_response.g.dart';
@JsonSerializable()
class UploadFileResponse {
  final String? message;
  UploadFileResponse({this.message});

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => _$UploadFileResponseFromJson(json);
}
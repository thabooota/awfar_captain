import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_report_request_body.g.dart';
@JsonSerializable()
class GetReportRequestBody {
  final String from;
  final String to;

  GetReportRequestBody({required this.from, required this.to});

  Map<String, dynamic> toJson() => _$GetReportRequestBodyToJson(this);
}
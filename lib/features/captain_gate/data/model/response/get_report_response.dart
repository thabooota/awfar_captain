import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_report_response.g.dart';
@JsonSerializable()
class GetReportResponse {
  final List<TripCompletedInfo> TripCompleted;
  final String Percentage_completed_trips;

  GetReportResponse({required this.TripCompleted, required this.Percentage_completed_trips});

  factory GetReportResponse.fromJson(Map<String, dynamic> json) => _$GetReportResponseFromJson(json);
}

@JsonSerializable()
class TripCompletedInfo {
  final String client;
  final int price;
  final String trip_number;

  TripCompletedInfo({required this.client, required this.price, required this.trip_number});

  factory TripCompletedInfo.fromJson(Map<String, dynamic> json) => _$TripCompletedInfoFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';
part 'rate_client_request_body.g.dart';
@JsonSerializable()
class RateClientRequestBody {
  final int rate;
  final String comment;

  RateClientRequestBody({required this.rate,required this.comment});

  Map<String, dynamic> toJson() => _$RateClientRequestBodyToJson(this);
}
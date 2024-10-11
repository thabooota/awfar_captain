class RestTripResponse {
  final TripInfo data;
  RestTripResponse({required this.data});
}

class TripInfo {
  final int tripId;
  final String form;
  final String to;
  final int price;
  final String from_long;
  final String from_lat;
  final String to_long;
  final String to_lat;
  final String Client_Name;
  TripInfo(
      {
        required this.from_long,
      required this.from_lat,
      required this.to_long,
      required this.price,
      required this.form,
      required this.to,
      required this.to_lat,
      required this.tripId,
      required this.Client_Name,
      });
}

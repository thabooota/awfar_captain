class TripEntity {
  final String id,
      date,
      time,
      tripNumber,
      from,
      to,
      coupon,
      cost,
      finalTotalCost,
      status;

  const TripEntity({
    required this.id,
    required this.date,
    required this.time,
    required this.tripNumber,
    required this.from,
    required this.to,
    required this.coupon,
    required this.cost,
    required this.finalTotalCost,
    required this.status,
  });
}
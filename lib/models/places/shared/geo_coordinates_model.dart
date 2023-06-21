class GeoCoordinates {
  final double latitude;
  final double longitude;

  GeoCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory GeoCoordinates.fromJson(Map<String, dynamic> json) {
    return GeoCoordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

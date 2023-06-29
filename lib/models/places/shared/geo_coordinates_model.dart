/// Represents a geographical location using latitude and longitude coordinates.
///
/// This class encapsulates the latitude and longitude values that define a geographical location.
class GeoCoordinates {
  /// The latitude of the geographical location.
  ///
  /// Latitude is a geographical coordinate that specifies the north-south position of a point on the Earth's surface.
  final double? latitude;

  /// The longitude of the geographical location.
  ///
  /// Longitude is a geographical coordinate that specifies the east-west position of a point on the Earth's surface.
  final double? longitude;

  /// Creates a new instance of [GeoCoordinates].
  GeoCoordinates({
    this.latitude,
    this.longitude,
  });

  /// Creates a new instance of [GeoCoordinates] from a JSON object.
  ///
  /// The JSON object should contain keys 'latitude' and 'longitude' that map to the corresponding properties of a [GeoCoordinates].
  factory GeoCoordinates.fromJson(Map<String, dynamic> json) {
    return GeoCoordinates(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  /// Returns a JSON-compatible map that represents this [GeoCoordinates].
  ///
  /// This method can be used when storing this [GeoCoordinates] in a database or sending it over a network.
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

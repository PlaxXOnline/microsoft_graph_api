import 'package:microsoft_graph_api/models/models.dart';

/// Represents a location for a calendar event.
///
/// Each instance holds the availability resolution, display name,
/// location email address, physical address, and geographical coordinates of the location.
class Location {
  /// Indicates whether the availability of the location should be resolved.
  final bool? resolveAvailability;

  /// The display name of the location.
  final String? displayName;

  /// The email address associated with the location.
  final String? locationEmailAddress;

  /// The physical address of the location.
  final Address? address;

  /// The geographical coordinates of the location.
  final GeoCoordinates? coordinates;

  /// Creates a new instance of [Location].
  ///
  /// All parameters are optional.
  Location(
      {this.resolveAvailability,
      this.displayName,
      this.locationEmailAddress,
      this.address,
      this.coordinates});

  /// Creates a new instance of [Location] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [Location].
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      resolveAvailability: json['resolveAvailability'],
      displayName: json['displayName'],
      locationEmailAddress: json['locationEmailAddress'],
      address: Address.fromJson(json['address']),
      coordinates: GeoCoordinates.fromJson(json['coordinates']),
    );
  }

  /// Converts this [Location] object to a JSON object.
  ///
  /// Each parameter of [Location] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    return {
      'resolveAvailability': resolveAvailability,
      'displayName': displayName,
      'locationEmailAddress': locationEmailAddress,
      'address': address?.toJson(),
      'coordinates': coordinates?.toJson(),
    };
  }
}

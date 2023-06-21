import 'package:microsoft_graph_api/models/models.dart';

class Location {
  bool? resolveAvailability;
  String? displayName;
  String? locationEmailAddress;
  Address? address;
  GeoCoordinates? coordinates;

  Location(
      {this.resolveAvailability,
      this.displayName,
      this.locationEmailAddress,
      this.address,
      this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      resolveAvailability: json['resolveAvailability'],
      displayName: json['displayName'],
      locationEmailAddress: json['locationEmailAddress'],
      address: Address.fromJson(json['address']),
      coordinates: GeoCoordinates.fromJson(json['coordinates']),
    );
  }

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

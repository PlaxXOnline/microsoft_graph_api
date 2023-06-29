import 'package:microsoft_graph_api/models/models.dart';

/// Represents a list of rooms in the Microsoft Graph API.
///
/// This class encapsulates various properties of a room list, such as its id, email address, display name, address, geo-coordinates, and more.
class RoomList {
  /// The unique identifier of the room list.
  final String? id;

  /// The display name of the room list.
  final String? displayName;

  /// The physical address of the room list.
  final Address? address;

  /// The email address of the room list.
  final String? emailAddress;

  /// The geographical coordinates of the room list.
  final GeoCoordinates? geocoordinates;

  /// The phone number of the room list.
  final String? phone;

  /// Creates a new instance of [RoomList].
  RoomList({
    this.id,
    this.displayName,
    this.address,
    this.emailAddress,
    this.geocoordinates,
    this.phone,
  });

  /// Creates a new instance of [RoomList] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the properties of [RoomList].
  factory RoomList.fromJson(Map<String, dynamic> json) {
    return RoomList(
      id: json['id'],
      displayName: json['displayName'],
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      emailAddress: json['emailAddress'],
      geocoordinates: json['geocoordinates'] != null
          ? GeoCoordinates.fromJson(json['geocoordinates'])
          : null,
      phone: json['phone'],
    );
  }

  /// Creates a copy of this [RoomList] but with the given fields replaced with the new values.
  RoomList copyWith({
    String? id,
    String? displayName,
    Address? address,
    String? emailAddress,
    GeoCoordinates? geocoordinates,
    String? phone,
  }) {
    return RoomList(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      address: address ?? this.address,
      emailAddress: emailAddress ?? this.emailAddress,
      geocoordinates: geocoordinates ?? this.geocoordinates,
      phone: phone ?? this.phone,
    );
  }
}

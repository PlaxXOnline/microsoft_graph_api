import 'package:microsoft_graph_api/models/models.dart';

class RoomList {
  final String id;
  final String displayName;
  final Address address;
  final String? emailAddress;
  final GeoCoordinates? geocoordinates;
  final String? phone;

  RoomList({
    required this.id,
    required this.displayName,
    required this.address,
    this.emailAddress,
    this.geocoordinates,
    this.phone,
  });

  factory RoomList.fromJson(Map<String, dynamic> json) {
    return RoomList(
      id: json['id'],
      displayName: json['displayName'],
      address: Address.fromJson(json['address']),
      emailAddress: json['emailAddress'],
      geocoordinates: json['geocoordinates'] != null
          ? GeoCoordinates.fromJson(json['geocoordinates'])
          : null,
      phone: json['phone'],
    );
  }

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

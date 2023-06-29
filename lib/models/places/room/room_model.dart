import 'package:microsoft_graph_api/models/models.dart';

/// Represents a room in the Microsoft Graph API.
///
/// This class encapsulates various properties of a room, such as its id, email address, display name, address, geo-coordinates, and more.
class Room {
  /// The unique identifier of the room.
  final String? id;

  /// The email address of the room.
  final String? emailAddress;

  /// The display name of the room.
  final String? displayName;

  /// The physical address of the room.
  final Address? address;

  /// The geographical coordinates of the room.
  final GeoCoordinates? geoCoordinates;

  /// The phone number of the room.
  final String? phone;

  /// The nickname of the room.
  final String? nickname;

  /// The label of the room.
  final String? label;

  /// The capacity of the room, i.e., the number of people it can accommodate.
  final int? capacity;

  /// The building where the room is located.
  final String? building;

  /// The floor number where the room is located.
  final int? floorNumber;

  /// Indicates if the room is managed.
  final bool? isManaged;

  /// Indicates if the room is accessible by wheelchair.
  final bool? isWheelChairAccessible;

  /// The booking type of the room.
  final String? bookingType;

  /// The tags associated with the room.
  final List<String>? tags;

  /// The name of the audio device in the room.
  final String? audioDeviceName;

  /// The name of the video device in the room.
  final String? videoDeviceName;

  /// The name of the display device in the room.
  final String? displayDevice;

  /// Creates a new instance of [Room].
  Room({
    this.id,
    this.emailAddress,
    this.displayName,
    this.address,
    this.geoCoordinates,
    this.phone,
    this.nickname,
    this.label,
    this.capacity,
    this.building,
    this.floorNumber,
    this.isManaged,
    this.isWheelChairAccessible,
    this.bookingType,
    this.tags,
    this.audioDeviceName,
    this.videoDeviceName,
    this.displayDevice,
  });

  /// Creates a new instance of [Room] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the properties of [Room].
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      emailAddress: json['emailAddress'],
      displayName: json['displayName'],
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      geoCoordinates: json['geoCoordinates'] != null
          ? GeoCoordinates.fromJson(json['geoCoordinates'])
          : null,
      phone: json['phone'],
      nickname: json['nickname'],
      label: json['label'],
      capacity: json['capacity'],
      building: json['building'],
      floorNumber: json['floorNumber'],
      isManaged: json['isManaged'],
      isWheelChairAccessible: json['isWheelChairAccessible'],
      bookingType: json['bookingType'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      audioDeviceName: json['audioDeviceName'],
      videoDeviceName: json['videoDeviceName'],
      displayDevice: json['displayDevice'],
    );
  }

  /// Creates a copy of this [Room] but with the given fields replaced with the new values.
  Room copyWith({
    String? id,
    String? emailAddress,
    String? displayName,
    Address? address,
    GeoCoordinates? geoCoordinates,
    String? phone,
    String? nickname,
    String? label,
    int? capacity,
    String? building,
    int? floorNumber,
    bool? isManaged,
    bool? isWheelChairAccessible,
    String? bookingType,
    List<String>? tags,
    String? audioDeviceName,
    String? videoDeviceName,
    String? displayDevice,
  }) {
    return Room(
      id: id ?? this.id,
      emailAddress: emailAddress ?? this.emailAddress,
      displayName: displayName ?? this.displayName,
      address: address ?? this.address,
      geoCoordinates: geoCoordinates ?? this.geoCoordinates,
      phone: phone ?? this.phone,
      nickname: nickname ?? this.nickname,
      label: label ?? this.label,
      capacity: capacity ?? this.capacity,
      building: building ?? this.building,
      floorNumber: floorNumber ?? this.floorNumber,
      isManaged: isManaged ?? this.isManaged,
      isWheelChairAccessible:
          isWheelChairAccessible ?? this.isWheelChairAccessible,
      bookingType: bookingType ?? this.bookingType,
      tags: tags ?? this.tags,
      audioDeviceName: audioDeviceName ?? this.audioDeviceName,
      videoDeviceName: videoDeviceName ?? this.videoDeviceName,
      displayDevice: displayDevice ?? this.displayDevice,
    );
  }
}

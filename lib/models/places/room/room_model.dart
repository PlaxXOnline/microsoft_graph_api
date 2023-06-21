import 'package:microsoft_graph_api/models/models.dart';

class Room {
  final String id;
  final String emailAddress;
  final String displayName;
  final Address address;
  final GeoCoordinates geoCoordinates;
  final String phone;
  final String nickname;
  final String label;
  final int capacity;
  final String building;
  final int floorNumber;
  final bool isManaged;
  final bool isWheelChairAccessible;
  final String bookingType;
  final List<String> tags;
  final String? audioDeviceName;
  final String? videoDeviceName;
  final String displayDevice;

  Room({
    required this.id,
    required this.emailAddress,
    required this.displayName,
    required this.address,
    required this.geoCoordinates,
    required this.phone,
    required this.nickname,
    required this.label,
    required this.capacity,
    required this.building,
    required this.floorNumber,
    required this.isManaged,
    required this.isWheelChairAccessible,
    required this.bookingType,
    required this.tags,
    this.audioDeviceName,
    this.videoDeviceName,
    required this.displayDevice,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      emailAddress: json['emailAddress'],
      displayName: json['displayName'],
      address: Address.fromJson(json['address']),
      geoCoordinates: GeoCoordinates.fromJson(json['geoCoordinates']),
      phone: json['phone'],
      nickname: json['nickname'],
      label: json['label'],
      capacity: json['capacity'],
      building: json['building'],
      floorNumber: json['floorNumber'],
      isManaged: json['isManaged'],
      isWheelChairAccessible: json['isWheelChairAccessible'],
      bookingType: json['bookingType'],
      tags: List<String>.from(json['tags']),
      audioDeviceName: json['audioDeviceName'],
      videoDeviceName: json['videoDeviceName'],
      displayDevice: json['displayDevice'],
    );
  }

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

import 'package:json_annotation/json_annotation.dart';

part 'drive_model.g.dart';

/// Represents a drive in Microsoft Graph API.
/// 
/// A drive is the top-level container for content stored in OneDrive or SharePoint.
/// This includes personal OneDrive, OneDrive for Business, and SharePoint document libraries.
@JsonSerializable()
class Drive {
  /// The unique identifier of the drive.
  final String? id;
  
  /// Name of the drive (e.g., "OneDrive" or a SharePoint document library name).
  final String? name;
  
  /// The user account that owns the drive.
  final IdentitySet? owner;
  
  /// The type of drive.
  /// Possible values are personal, business, documentLibrary.
  final String? driveType;
  
  /// Quota information for the drive.
  final DriveQuota? quota;
  
  /// The URL that can be used to access the drive in a browser.
  final String? webUrl;

  /// Creates a new Drive instance.
  Drive({
    this.id,
    this.name,
    this.driveType,
    this.owner,
    this.quota,
    this.webUrl,
  });

  /// Creates a Drive instance from JSON data.
  factory Drive.fromJson(Map<String, dynamic> json) => _$DriveFromJson(json);

  /// Converts this Drive instance to JSON data.
  Map<String, dynamic> toJson() => _$DriveToJson(this);
}

/// Represents the quota information of a drive.
@JsonSerializable()
class DriveQuota {
  /// Total allowed storage space, in bytes.
  final int? total;
  
  /// Used space, in bytes.
  final int? used;
  
  /// Remaining space, in bytes.
  final int? remaining;
  
  /// Total space, in bytes, allocated to all drives of the signed-in user.
  final int? allocated;
  
  /// Quota state. Values: normal, warning, exceeded, unknownFutureValue.
  final String? state;

  /// Creates a new DriveQuota instance.
  DriveQuota({
    this.total,
    this.used,
    this.remaining,
    this.allocated,
    this.state,
  });

  /// Creates a DriveQuota instance from JSON data.
  factory DriveQuota.fromJson(Map<String, dynamic> json) =>
      _$DriveQuotaFromJson(json);

  /// Converts this DriveQuota instance to JSON data.
  Map<String, dynamic> toJson() => _$DriveQuotaToJson(this);
}

/// Represents an identity set in Microsoft Graph API.
@JsonSerializable()
class IdentitySet {
  /// The application associated with this action.
  final Identity? application;
  
  /// The device associated with this action.
  final Identity? device;
  
  /// The user associated with this action.
  final Identity? user;

  /// Creates a new IdentitySet instance.
  IdentitySet({
    this.application,
    this.device,
    this.user,
  });

  /// Creates an IdentitySet instance from JSON data.
  factory IdentitySet.fromJson(Map<String, dynamic> json) =>
      _$IdentitySetFromJson(json);

  /// Converts this IdentitySet instance to JSON data.
  Map<String, dynamic> toJson() => _$IdentitySetToJson(this);
}

/// Represents an identity in Microsoft Graph API.
@JsonSerializable()
class Identity {
  /// The identity's display name.
  final String? displayName;
  
  /// The unique identifier for the identity.
  final String? id;

  /// Creates a new Identity instance.
  Identity({
    this.displayName,
    this.id,
  });

  /// Creates an Identity instance from JSON data.
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  /// Converts this Identity instance to JSON data.
  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}

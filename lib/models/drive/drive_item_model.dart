import 'package:json_annotation/json_annotation.dart';
import 'drive_model.dart';

part 'drive_item_model.g.dart';

/// Represents an item within a drive in Microsoft Graph API.
/// 
/// A DriveItem is an item stored in a drive, like a file or folder.
@JsonSerializable()
class DriveItem {
  /// The unique identifier of the drive item.
  final String? id;

  /// The name of the drive item.
  final String? name;

  /// The URL that displays the item in the browser.
  final String? webUrl;

  /// The size of the drive item in bytes.
  final int? size;

  /// Information about the drive item's parent folder.
  final ItemReference? parentReference;

  /// The date and time when the drive item was created.
  final String? createdDateTime;

  /// The date and time when the drive item was last modified.
  final String? lastModifiedDateTime;

  /// The identity of the user who created the drive item.
  final IdentitySet? createdBy;

  /// The identity of the user who last modified the drive item.
  final IdentitySet? lastModifiedBy;

  /// File metadata if the drive item is a file.
  final File? file;

  /// Folder metadata if the drive item is a folder.
  final Folder? folder;

  /// The eTag of the drive item.
  final String? eTag;

  /// The content type of the drive item.
  final String? contentType;

  /// Creates a new DriveItem instance.
  DriveItem({
    this.id,
    this.name,
    this.webUrl,
    this.size,
    this.parentReference,
    this.createdDateTime,
    this.lastModifiedDateTime,
    this.createdBy,
    this.lastModifiedBy,
    this.file,
    this.folder,
    this.eTag,
    this.contentType,
  });

  /// Creates a DriveItem instance from JSON data.
  factory DriveItem.fromJson(Map<String, dynamic> json) =>
      _$DriveItemFromJson(json);

  /// Converts this DriveItem instance to JSON data.
  Map<String, dynamic> toJson() => _$DriveItemToJson(this);

  /// Checks if this drive item is a folder.
  bool get isFolder => folder != null;

  /// Checks if this drive item is a file.
  bool get isFile => file != null;
}

/// Represents a reference to another item in the drive.
@JsonSerializable()
class ItemReference {
  /// The unique identifier of the drive.
  final String? driveId;

  /// The unique identifier of the item.
  final String? id;

  /// The path of the item from the root.
  final String? path;

  /// Creates a new ItemReference instance.
  ItemReference({
    this.driveId,
    this.id,
    this.path,
  });

  /// Creates an ItemReference instance from JSON data.
  factory ItemReference.fromJson(Map<String, dynamic> json) =>
      _$ItemReferenceFromJson(json);

  /// Converts this ItemReference instance to JSON data.
  Map<String, dynamic> toJson() => _$ItemReferenceToJson(this);
}

/// Represents file metadata in Microsoft Graph API.
@JsonSerializable()
class File {
  /// Properties of the file, including mimetype.
  final String? mimeType;

  /// Hash value of the file content, if available.
  final Hashes? hashes;

  /// Creates a new File instance.
  File({
    this.mimeType,
    this.hashes,
  });

  /// Creates a File instance from JSON data.
  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  /// Converts this File instance to JSON data.
  Map<String, dynamic> toJson() => _$FileToJson(this);
}

/// Represents folder metadata in Microsoft Graph API.
@JsonSerializable()
class Folder {
  /// The number of children in the folder.
  final int? childCount;

  /// Creates a new Folder instance.
  Folder({
    this.childCount,
  });

  /// Creates a Folder instance from JSON data.
  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  /// Converts this Folder instance to JSON data.
  Map<String, dynamic> toJson() => _$FolderToJson(this);
}

/// Represents file hashes in Microsoft Graph API.
@JsonSerializable()
class Hashes {
  /// SHA1 hash of the file (if available).
  final String? sha1Hash;

  /// Creates a new Hashes instance.
  Hashes({
    this.sha1Hash,
  });

  /// Creates a Hashes instance from JSON data.
  factory Hashes.fromJson(Map<String, dynamic> json) => _$HashesFromJson(json);

  /// Converts this Hashes instance to JSON data.
  Map<String, dynamic> toJson() => _$HashesToJson(this);
}

/// Represents a thumbnail in Microsoft Graph API.
@JsonSerializable()
class Thumbnail {
  /// The height of the thumbnail, in pixels.
  final int? height;

  /// The width of the thumbnail, in pixels.
  final int? width;

  /// The URL used to fetch the thumbnail content.
  final String? url;

  /// Creates a new Thumbnail instance.
  Thumbnail({
    this.height,
    this.width,
    this.url,
  });

  /// Creates a Thumbnail instance from JSON data.
  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  /// Converts this Thumbnail instance to JSON data.
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

/// Represents a collection of thumbnails in Microsoft Graph API.
@JsonSerializable()
class ThumbnailSet {
  /// A thumbnail of small size.
  final Thumbnail? small;

  /// A thumbnail of medium size.
  final Thumbnail? medium;

  /// A thumbnail of large size.
  final Thumbnail? large;

  /// Creates a new ThumbnailSet instance.
  ThumbnailSet({
    this.small,
    this.medium,
    this.large,
  });

  /// Creates a ThumbnailSet instance from JSON data.
  factory ThumbnailSet.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailSetFromJson(json);

  /// Converts this ThumbnailSet instance to JSON data.
  Map<String, dynamic> toJson() => _$ThumbnailSetToJson(this);
}

/// Represents the request to upload a new file or update the contents of an existing file.
@JsonSerializable()
class UploadSession {
  /// The URL endpoint for uploading bytes to the file.
  final String? uploadUrl;

  /// The date and time when the upload session will expire.
  final String? expirationDateTime;

  /// Creates a new UploadSession instance.
  UploadSession({
    this.uploadUrl,
    this.expirationDateTime,
  });

  /// Creates an UploadSession instance from JSON data.
  factory UploadSession.fromJson(Map<String, dynamic> json) =>
      _$UploadSessionFromJson(json);

  /// Converts this UploadSession instance to JSON data.
  Map<String, dynamic> toJson() => _$UploadSessionToJson(this);
}

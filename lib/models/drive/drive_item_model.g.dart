// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriveItem _$DriveItemFromJson(Map<String, dynamic> json) => DriveItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
      webUrl: json['webUrl'] as String?,
      size: (json['size'] as num?)?.toInt(),
      parentReference: json['parentReference'] == null
          ? null
          : ItemReference.fromJson(
              json['parentReference'] as Map<String, dynamic>),
      createdDateTime: json['createdDateTime'] as String?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : IdentitySet.fromJson(json['createdBy'] as Map<String, dynamic>),
      lastModifiedBy: json['lastModifiedBy'] == null
          ? null
          : IdentitySet.fromJson(
              json['lastModifiedBy'] as Map<String, dynamic>),
      file: json['file'] == null
          ? null
          : File.fromJson(json['file'] as Map<String, dynamic>),
      folder: json['folder'] == null
          ? null
          : Folder.fromJson(json['folder'] as Map<String, dynamic>),
      eTag: json['eTag'] as String?,
      contentType: json['contentType'] as String?,
    );

Map<String, dynamic> _$DriveItemToJson(DriveItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'webUrl': instance.webUrl,
      'size': instance.size,
      'parentReference': instance.parentReference,
      'createdDateTime': instance.createdDateTime,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'createdBy': instance.createdBy,
      'lastModifiedBy': instance.lastModifiedBy,
      'file': instance.file,
      'folder': instance.folder,
      'eTag': instance.eTag,
      'contentType': instance.contentType,
    };

ItemReference _$ItemReferenceFromJson(Map<String, dynamic> json) =>
    ItemReference(
      driveId: json['driveId'] as String?,
      id: json['id'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ItemReferenceToJson(ItemReference instance) =>
    <String, dynamic>{
      'driveId': instance.driveId,
      'id': instance.id,
      'path': instance.path,
    };

File _$FileFromJson(Map<String, dynamic> json) => File(
      mimeType: json['mimeType'] as String?,
      hashes: json['hashes'] == null
          ? null
          : Hashes.fromJson(json['hashes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'mimeType': instance.mimeType,
      'hashes': instance.hashes,
    };

Folder _$FolderFromJson(Map<String, dynamic> json) => Folder(
      childCount: (json['childCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FolderToJson(Folder instance) => <String, dynamic>{
      'childCount': instance.childCount,
    };

Hashes _$HashesFromJson(Map<String, dynamic> json) => Hashes(
      sha1Hash: json['sha1Hash'] as String?,
    );

Map<String, dynamic> _$HashesToJson(Hashes instance) => <String, dynamic>{
      'sha1Hash': instance.sha1Hash,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
    };

ThumbnailSet _$ThumbnailSetFromJson(Map<String, dynamic> json) => ThumbnailSet(
      small: json['small'] == null
          ? null
          : Thumbnail.fromJson(json['small'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
      large: json['large'] == null
          ? null
          : Thumbnail.fromJson(json['large'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailSetToJson(ThumbnailSet instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

UploadSession _$UploadSessionFromJson(Map<String, dynamic> json) =>
    UploadSession(
      uploadUrl: json['uploadUrl'] as String?,
      expirationDateTime: json['expirationDateTime'] as String?,
    );

Map<String, dynamic> _$UploadSessionToJson(UploadSession instance) =>
    <String, dynamic>{
      'uploadUrl': instance.uploadUrl,
      'expirationDateTime': instance.expirationDateTime,
    };

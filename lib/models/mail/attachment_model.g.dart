// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String?,
      name: json['name'] as String?,
      contentType: json['contentType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      isInline: json['isInline'] as bool?,
      lastModifiedDateTime: json['lastModifiedDateTime'] == null
          ? null
          : DateTime.parse(json['lastModifiedDateTime'] as String),
      contentId: json['contentId'] as String?,
      contentBytes: json['contentBytes'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contentType': instance.contentType,
      'size': instance.size,
      'isInline': instance.isInline,
      'lastModifiedDateTime': instance.lastModifiedDateTime?.toIso8601String(),
      'contentId': instance.contentId,
      'contentBytes': instance.contentBytes,
    };

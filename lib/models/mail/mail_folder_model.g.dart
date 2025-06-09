// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MailFolder _$MailFolderFromJson(Map<String, dynamic> json) => MailFolder(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      childFolderCount: (json['childFolderCount'] as num?)?.toInt(),
      totalItemCount: (json['totalItemCount'] as num?)?.toInt(),
      unreadItemCount: (json['unreadItemCount'] as num?)?.toInt(),
      parentFolderId: json['parentFolderId'] as String?,
    );

Map<String, dynamic> _$MailFolderToJson(MailFolder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'childFolderCount': instance.childFolderCount,
      'totalItemCount': instance.totalItemCount,
      'unreadItemCount': instance.unreadItemCount,
      'parentFolderId': instance.parentFolderId,
    };

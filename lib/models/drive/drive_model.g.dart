// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drive _$DriveFromJson(Map<String, dynamic> json) => Drive(
      id: json['id'] as String?,
      name: json['name'] as String?,
      driveType: json['driveType'] as String?,
      owner: json['owner'] == null
          ? null
          : IdentitySet.fromJson(json['owner'] as Map<String, dynamic>),
      quota: json['quota'] == null
          ? null
          : DriveQuota.fromJson(json['quota'] as Map<String, dynamic>),
      webUrl: json['webUrl'] as String?,
    );

Map<String, dynamic> _$DriveToJson(Drive instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'driveType': instance.driveType,
      'quota': instance.quota,
      'webUrl': instance.webUrl,
    };

DriveQuota _$DriveQuotaFromJson(Map<String, dynamic> json) => DriveQuota(
      total: (json['total'] as num?)?.toInt(),
      used: (json['used'] as num?)?.toInt(),
      remaining: (json['remaining'] as num?)?.toInt(),
      allocated: (json['allocated'] as num?)?.toInt(),
      state: json['state'] as String?,
    );

Map<String, dynamic> _$DriveQuotaToJson(DriveQuota instance) =>
    <String, dynamic>{
      'total': instance.total,
      'used': instance.used,
      'remaining': instance.remaining,
      'allocated': instance.allocated,
      'state': instance.state,
    };

IdentitySet _$IdentitySetFromJson(Map<String, dynamic> json) => IdentitySet(
      application: json['application'] == null
          ? null
          : Identity.fromJson(json['application'] as Map<String, dynamic>),
      device: json['device'] == null
          ? null
          : Identity.fromJson(json['device'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : Identity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IdentitySetToJson(IdentitySet instance) =>
    <String, dynamic>{
      'application': instance.application,
      'device': instance.device,
      'user': instance.user,
    };

Identity _$IdentityFromJson(Map<String, dynamic> json) => Identity(
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'id': instance.id,
    };

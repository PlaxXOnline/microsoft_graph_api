// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupCreateRequest _$GroupCreateRequestFromJson(Map<String, dynamic> json) =>
    GroupCreateRequest(
      displayName: json['displayName'] as String,
      mailNickname: json['mailNickname'] as String,
      description: json['description'] as String?,
      owners:
          (json['owners'] as List<dynamic>?)?.map((e) => e as String).toList(),
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      groupTypes: (json['groupTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mailEnabled: json['mailEnabled'] as bool?,
      securityEnabled: json['securityEnabled'] as bool?,
      visibility: json['visibility'] as String?,
      preferredLanguage: json['preferredLanguage'] as String?,
    );

Map<String, dynamic> _$GroupCreateRequestToJson(GroupCreateRequest instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'mailNickname': instance.mailNickname,
      'description': instance.description,
      'owners': instance.owners,
      'members': instance.members,
      'groupTypes': instance.groupTypes,
      'mailEnabled': instance.mailEnabled,
      'securityEnabled': instance.securityEnabled,
      'visibility': instance.visibility,
      'preferredLanguage': instance.preferredLanguage,
    };

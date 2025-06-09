// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_lifecycle_policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupLifecyclePolicy _$GroupLifecyclePolicyFromJson(
        Map<String, dynamic> json) =>
    GroupLifecyclePolicy(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      groupLifetimeInDays: (json['groupLifetimeInDays'] as num?)?.toInt(),
      managedGroupTypes: (json['managedGroupTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alternateNotificationEmails:
          (json['alternateNotificationEmails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$GroupLifecyclePolicyToJson(
        GroupLifecyclePolicy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'groupLifetimeInDays': instance.groupLifetimeInDays,
      'managedGroupTypes': instance.managedGroupTypes,
      'alternateNotificationEmails': instance.alternateNotificationEmails,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      mail: json['mail'] as String?,
      mailNickname: json['mailNickname'] as String?,
      description: json['description'] as String?,
      visibility: json['visibility'] as String?,
      groupLifecyclePolicy: json['groupLifecyclePolicy'] as String?,
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      classification: json['classification'] as String?,
      hasExternalMembers: json['hasExternalMembers'] as bool?,
      proxyAddresses: (json['proxyAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mailboxSettings: json['mailboxSettings'] as String?,
      isArchived: json['isArchived'] as bool?,
      legalAgeGroupClassification:
          json['legalAgeGroupClassification'] as String?,
      isSubscribedByMail: json['isSubscribedByMail'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
      renewedDateTime: json['renewedDateTime'] == null
          ? null
          : DateTime.parse(json['renewedDateTime'] as String),
      securityEnabled: json['securityEnabled'] as bool?,
      securityIdentifier: json['securityIdentifier'] as String?,
      mailEnabled: json['mailEnabled'] as bool?,
      theme:
          (json['theme'] as List<dynamic>?)?.map((e) => e as String).toList(),
      groupTypes: (json['groupTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      membershipRule: json['membershipRule'] as String?,
      membershipRuleProcessingState:
          json['membershipRuleProcessingState'] as bool?,
      preferredDataLocation: json['preferredDataLocation'] as String?,
      preferredLanguage: json['preferredLanguage'] as String?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'mail': instance.mail,
      'mailNickname': instance.mailNickname,
      'description': instance.description,
      'visibility': instance.visibility,
      'groupLifecyclePolicy': instance.groupLifecyclePolicy,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'classification': instance.classification,
      'hasExternalMembers': instance.hasExternalMembers,
      'proxyAddresses': instance.proxyAddresses,
      'mailboxSettings': instance.mailboxSettings,
      'isArchived': instance.isArchived,
      'legalAgeGroupClassification': instance.legalAgeGroupClassification,
      'isSubscribedByMail': instance.isSubscribedByMail,
      'isFavorite': instance.isFavorite,
      'renewedDateTime': instance.renewedDateTime?.toIso8601String(),
      'securityEnabled': instance.securityEnabled,
      'securityIdentifier': instance.securityIdentifier,
      'mailEnabled': instance.mailEnabled,
      'theme': instance.theme,
      'groupTypes': instance.groupTypes,
      'membershipRule': instance.membershipRule,
      'membershipRuleProcessingState': instance.membershipRuleProcessingState,
      'preferredDataLocation': instance.preferredDataLocation,
      'preferredLanguage': instance.preferredLanguage,
    };

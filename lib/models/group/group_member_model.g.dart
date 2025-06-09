// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) => GroupMember(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      userPrincipalName: json['userPrincipalName'] as String?,
      mail: json['mail'] as String?,
    );

Map<String, dynamic> _$GroupMemberToJson(GroupMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'userPrincipalName': instance.userPrincipalName,
      'mail': instance.mail,
    };

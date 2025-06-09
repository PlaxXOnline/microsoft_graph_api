// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      sender: json['sender'] == null
          ? null
          : Recipient.fromJson(json['sender'] as Map<String, dynamic>),
      recipients: (json['recipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String?,
      body: json['body'] == null
          ? null
          : ItemBody.fromJson(json['body'] as Map<String, dynamic>),
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      lastModifiedDateTime: json['lastModifiedDateTime'] == null
          ? null
          : DateTime.parse(json['lastModifiedDateTime'] as String),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      changeKey: (json['changeKey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasAttachments: json['hasAttachments'] as bool?,
      importance: json['importance'] as String?,
      conversationId: json['conversationId'] as String?,
      conversationThreadId: json['conversationThreadId'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'recipients': instance.recipients,
      'subject': instance.subject,
      'body': instance.body,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'lastModifiedDateTime': instance.lastModifiedDateTime?.toIso8601String(),
      'categories': instance.categories,
      'changeKey': instance.changeKey,
      'hasAttachments': instance.hasAttachments,
      'importance': instance.importance,
      'conversationId': instance.conversationId,
      'conversationThreadId': instance.conversationThreadId,
    };

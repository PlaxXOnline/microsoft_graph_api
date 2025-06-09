// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupConversation _$GroupConversationFromJson(Map<String, dynamic> json) =>
    GroupConversation(
      id: json['id'] as String?,
      topic: json['topic'] as String?,
      hasAttachments: json['hasAttachments'] as bool?,
      uniqueSenders: (json['uniqueSenders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastDeliveredDateTime: json['lastDeliveredDateTime'] == null
          ? null
          : DateTime.parse(json['lastDeliveredDateTime'] as String),
      preview: json['preview'] as String?,
      threads: (json['threads'] as List<dynamic>?)
          ?.map((e) => ConversationThread.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupConversationToJson(GroupConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'hasAttachments': instance.hasAttachments,
      'uniqueSenders': instance.uniqueSenders,
      'lastDeliveredDateTime':
          instance.lastDeliveredDateTime?.toIso8601String(),
      'preview': instance.preview,
      'threads': instance.threads,
    };

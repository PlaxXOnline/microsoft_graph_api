// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_thread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationThread _$ConversationThreadFromJson(Map<String, dynamic> json) =>
    ConversationThread(
      id: json['id'] as String?,
      topic: json['topic'] as String?,
      hasAttachments: json['hasAttachments'] as bool?,
      lastDeliveredDateTime: json['lastDeliveredDateTime'] == null
          ? null
          : DateTime.parse(json['lastDeliveredDateTime'] as String),
      preview: json['preview'] as String?,
      isLocked: json['isLocked'] as bool?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationThreadToJson(ConversationThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'hasAttachments': instance.hasAttachments,
      'lastDeliveredDateTime':
          instance.lastDeliveredDateTime?.toIso8601String(),
      'preview': instance.preview,
      'isLocked': instance.isLocked,
      'posts': instance.posts,
    };

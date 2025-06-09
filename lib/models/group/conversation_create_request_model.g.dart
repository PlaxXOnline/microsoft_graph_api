// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationCreateRequest _$ConversationCreateRequestFromJson(
        Map<String, dynamic> json) =>
    ConversationCreateRequest(
      topic: json['topic'] as String,
      message: json['message'] as String?,
      body: json['body'] == null
          ? null
          : ItemBody.fromJson(json['body'] as Map<String, dynamic>),
      recipients: (json['recipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationCreateRequestToJson(
        ConversationCreateRequest instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'message': instance.message,
      'body': instance.body,
      'recipients': instance.recipients,
    };

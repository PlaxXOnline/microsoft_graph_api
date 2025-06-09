// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCreateRequest _$PostCreateRequestFromJson(Map<String, dynamic> json) =>
    PostCreateRequest(
      body: json['body'] == null
          ? null
          : ItemBody.fromJson(json['body'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      importance: json['importance'] as String?,
      recipients: (json['recipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String?,
    );

Map<String, dynamic> _$PostCreateRequestToJson(PostCreateRequest instance) =>
    <String, dynamic>{
      'body': instance.body,
      'categories': instance.categories,
      'importance': instance.importance,
      'recipients': instance.recipients,
      'subject': instance.subject,
    };

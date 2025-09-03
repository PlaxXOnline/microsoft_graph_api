// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageCreateRequest _$MessageCreateRequestFromJson(
        Map<String, dynamic> json) =>
    MessageCreateRequest(
      subject: json['subject'] as String,
      body: ItemBody.fromJson(json['body'] as Map<String, dynamic>),
      importance: json['importance'] as String?,
      toRecipients: (json['toRecipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ccRecipients: (json['ccRecipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      bccRecipients: (json['bccRecipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageCreateRequestToJson(
        MessageCreateRequest instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'importance': instance.importance,
      'body': instance.body,
      'toRecipients': instance.toRecipients,
      'ccRecipients': instance.ccRecipients,
      'bccRecipients': instance.bccRecipients,
    };

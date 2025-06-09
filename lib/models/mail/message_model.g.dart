// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String?,
      subject: json['subject'] as String?,
      bodyPreview: json['bodyPreview'] as String?,
      hasAttachments: json['hasAttachments'] as bool?,
      importance: json['importance'] as String?,
      receivedDateTime: json['receivedDateTime'] == null
          ? null
          : DateTime.parse(json['receivedDateTime'] as String),
      sentDateTime: json['sentDateTime'] == null
          ? null
          : DateTime.parse(json['sentDateTime'] as String),
      sender: json['sender'] == null
          ? null
          : Recipient.fromJson(json['sender'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : Recipient.fromJson(json['from'] as Map<String, dynamic>),
      toRecipients: (json['toRecipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ccRecipients: (json['ccRecipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      bccRecipients: (json['bccRecipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      body: json['body'] == null
          ? null
          : ItemBody.fromJson(json['body'] as Map<String, dynamic>),
      isRead: json['isRead'] as bool?,
      followupFlag: json['flag'] == null
          ? null
          : FollowupFlag.fromJson(json['flag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'bodyPreview': instance.bodyPreview,
      'hasAttachments': instance.hasAttachments,
      'importance': instance.importance,
      'receivedDateTime': instance.receivedDateTime?.toIso8601String(),
      'sentDateTime': instance.sentDateTime?.toIso8601String(),
      'sender': instance.sender,
      'from': instance.from,
      'toRecipients': instance.toRecipients,
      'ccRecipients': instance.ccRecipients,
      'bccRecipients': instance.bccRecipients,
      'body': instance.body,
      'isRead': instance.isRead,
      'flag': instance.followupFlag,
    };

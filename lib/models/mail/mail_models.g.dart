// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_models.dart';

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

MailFolder _$MailFolderFromJson(Map<String, dynamic> json) => MailFolder(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      childFolderCount: json['childFolderCount'] as int?,
      totalItemCount: json['totalItemCount'] as int?,
      unreadItemCount: json['unreadItemCount'] as int?,
      parentFolderId: json['parentFolderId'] as String?,
    );

Map<String, dynamic> _$MailFolderToJson(MailFolder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'childFolderCount': instance.childFolderCount,
      'totalItemCount': instance.totalItemCount,
      'unreadItemCount': instance.unreadItemCount,
      'parentFolderId': instance.parentFolderId,
    };

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
      emailAddress: json['emailAddress'] == null
          ? null
          : EmailAddress.fromJson(json['emailAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
      'emailAddress': instance.emailAddress,
    };

// EmailAddress serialization removed - using the one from calendar models

ItemBody _$ItemBodyFromJson(Map<String, dynamic> json) => ItemBody(
      contentType: json['contentType'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ItemBodyToJson(ItemBody instance) => <String, dynamic>{
      'contentType': instance.contentType,
      'content': instance.content,
    };

FollowupFlag _$FollowupFlagFromJson(Map<String, dynamic> json) => FollowupFlag(
      flagStatus: json['flagStatus'] as String?,
      completedDateTime: json['completedDateTime'] == null
          ? null
          : DateTime.parse(json['completedDateTime'] as String),
      dueDateTime: json['dueDateTime'] == null
          ? null
          : DateTime.parse(json['dueDateTime'] as String),
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
    );

Map<String, dynamic> _$FollowupFlagToJson(FollowupFlag instance) =>
    <String, dynamic>{
      'flagStatus': instance.flagStatus,
      'completedDateTime': instance.completedDateTime?.toIso8601String(),
      'dueDateTime': instance.dueDateTime?.toIso8601String(),
      'startDateTime': instance.startDateTime?.toIso8601String(),
    };

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String?,
      name: json['name'] as String?,
      contentType: json['contentType'] as String?,
      size: json['size'] as int?,
      isInline: json['isInline'] as bool?,
      lastModifiedDateTime: json['lastModifiedDateTime'] == null
          ? null
          : DateTime.parse(json['lastModifiedDateTime'] as String),
      contentId: json['contentId'] as String?,
      contentBytes: json['contentBytes'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contentType': instance.contentType,
      'size': instance.size,
      'isInline': instance.isInline,
      'lastModifiedDateTime': instance.lastModifiedDateTime?.toIso8601String(),
      'contentId': instance.contentId,
      'contentBytes': instance.contentBytes,
    };

MessageCreateRequest _$MessageCreateRequestFromJson(Map<String, dynamic> json) =>
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
      saveToSentItems: json['saveToSentItems'] as bool?,
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
      'saveToSentItems': instance.saveToSentItems,
    };

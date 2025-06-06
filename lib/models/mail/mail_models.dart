
import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/calendar/email_address_model.dart';

part 'mail_models.g.dart';

/// Represents an email message in a user's mailbox.
@JsonSerializable()
class Message {
  /// The message ID.
  final String? id;

  /// The subject line of the message.
  final String? subject;

  /// The HTML body content of the message.
  final String? bodyPreview;

  /// Indicates whether the message has attachments.
  final bool? hasAttachments;

  /// The importance of the message: low, normal, or high.
  final String? importance;

  /// The date and time the message was received.
  final DateTime? receivedDateTime;

  /// The date and time the message was sent.
  final DateTime? sentDateTime;

  /// The sender of the message.
  final Recipient? sender;

  /// The display name of the sender.
  @JsonKey(name: 'from')
  final Recipient? from;

  /// The recipient list for the message.
  final List<Recipient>? toRecipients;

  /// The CC recipient list for the message.
  final List<Recipient>? ccRecipients;

  /// The BCC recipient list for the message.
  final List<Recipient>? bccRecipients;

  /// The message body.
  final ItemBody? body;

  /// Flag indicating whether the message has been read.
  final bool? isRead;

  /// Flag indicating whether the message has been favorited/flagged.
  @JsonKey(name: 'flag')
  final FollowupFlag? followupFlag;

  Message({
    this.id,
    this.subject,
    this.bodyPreview,
    this.hasAttachments,
    this.importance,
    this.receivedDateTime,
    this.sentDateTime,
    this.sender,
    this.from,
    this.toRecipients,
    this.ccRecipients,
    this.bccRecipients,
    this.body,
    this.isRead,
    this.followupFlag,
  });

  const Message.empty()
      : id = null,
        subject = null,
        bodyPreview = null,
        hasAttachments = null,
        importance = null,
        receivedDateTime = null,
        sentDateTime = null,
        sender = null,
        from = null,
        toRecipients = null,
        ccRecipients = null,
        bccRecipients = null,
        body = null,
        isRead = null,
        followupFlag = null;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// Represents a mail folder in a mailbox.
@JsonSerializable()
class MailFolder {
  /// The folder's unique identifier.
  final String? id;

  /// The folder's display name.
  final String? displayName;

  /// The number of immediate child folders in the folder.
  final int? childFolderCount;

  /// The number of items in the folder.
  final int? totalItemCount;

  /// The number of unread items in the folder.
  final int? unreadItemCount;

  /// The parent folder's ID, or null if it's a root folder.
  final String? parentFolderId;

  MailFolder({
    this.id,
    this.displayName,
    this.childFolderCount,
    this.totalItemCount,
    this.unreadItemCount,
    this.parentFolderId,
  });

  const MailFolder.empty()
      : id = null,
        displayName = null,
        childFolderCount = null,
        totalItemCount = null,
        unreadItemCount = null,
        parentFolderId = null;

  factory MailFolder.fromJson(Map<String, dynamic> json) => _$MailFolderFromJson(json);
  Map<String, dynamic> toJson() => _$MailFolderToJson(this);
}

/// Represents an email recipient (sender, to, cc, bcc).
@JsonSerializable()
class Recipient {
  /// The recipient's email address information.
  final EmailAddress? emailAddress;

  Recipient({this.emailAddress});

  const Recipient.empty() : emailAddress = null;

  factory Recipient.fromJson(Map<String, dynamic> json) => _$RecipientFromJson(json);
  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}

// EmailAddress class is imported from calendar models

/// Represents the body of an item, such as a message or event.
@JsonSerializable()
class ItemBody {
  /// The content type of the body. Values: text, html.
  final String? contentType;

  /// The content of the body.
  final String? content;

  ItemBody({
    this.contentType,
    this.content,
  });

  const ItemBody.empty()
      : contentType = null,
        content = null;

  factory ItemBody.fromJson(Map<String, dynamic> json) => _$ItemBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ItemBodyToJson(this);
}

/// Represents a flag to follow up on a message.
@JsonSerializable()
class FollowupFlag {
  /// The status of the flag. Possible values are: notFlagged, complete, flagged.
  final String? flagStatus;

  /// The date and time when the follow-up was completed.
  final DateTime? completedDateTime;

  /// The date and time when the follow-up is due.
  final DateTime? dueDateTime;

  /// The date and time when the follow-up is scheduled to start.
  final DateTime? startDateTime;

  FollowupFlag({
    this.flagStatus,
    this.completedDateTime,
    this.dueDateTime,
    this.startDateTime,
  });

  const FollowupFlag.empty()
      : flagStatus = null,
        completedDateTime = null,
        dueDateTime = null,
        startDateTime = null;

  factory FollowupFlag.fromJson(Map<String, dynamic> json) => _$FollowupFlagFromJson(json);
  Map<String, dynamic> toJson() => _$FollowupFlagToJson(this);
}

/// Represents a message attachment.
@JsonSerializable()
class Attachment {
  /// The attachment ID.
  final String? id;

  /// The attachment name.
  final String? name;

  /// The attachment's MIME type.
  final String? contentType;

  /// Size of the attachment in bytes.
  final int? size;

  /// When true, indicates the attachment is an inline attachment and appears
  /// directly in the body of the message.
  final bool? isInline;

  /// The date and time when the attachment was last modified.
  final DateTime? lastModifiedDateTime;

  /// The attachment's content ID for inline attachments.
  final String? contentId;

  /// The base64-encoded contents of the file if the attachment is a file.
  final String? contentBytes;

  Attachment({
    this.id,
    this.name,
    this.contentType,
    this.size,
    this.isInline,
    this.lastModifiedDateTime,
    this.contentId,
    this.contentBytes,
  });

  const Attachment.empty()
      : id = null,
        name = null,
        contentType = null,
        size = null,
        isInline = null,
        lastModifiedDateTime = null,
        contentId = null,
        contentBytes = null;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

/// Class representing a draft message creation request
@JsonSerializable()
class MessageCreateRequest {
  /// The subject of the message.
  final String subject;

  /// The importance of the message: low, normal, high.
  final String? importance;

  /// The body of the message.
  final ItemBody body;

  /// The recipient list for the message.
  final List<Recipient>? toRecipients;

  /// The CC recipient list for the message.
  final List<Recipient>? ccRecipients;

  /// The BCC recipient list for the message.
  final List<Recipient>? bccRecipients;

  /// Whether to save the message in the Sent Items folder.
  final bool? saveToSentItems;

  MessageCreateRequest({
    required this.subject,
    required this.body,
    this.importance,
    this.toRecipients,
    this.ccRecipients,
    this.bccRecipients,
    this.saveToSentItems,
  });

  factory MessageCreateRequest.fromJson(Map<String, dynamic> json) => _$MessageCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MessageCreateRequestToJson(this);
}

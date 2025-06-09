import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/mail/recipient_model.dart';
import 'package:microsoft_graph_api/models/mail/item_body_model.dart';
import 'package:microsoft_graph_api/models/mail/followup_flag_model.dart';

part 'message_model.g.dart';

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

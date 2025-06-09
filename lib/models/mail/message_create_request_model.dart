import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/mail/item_body_model.dart';
import 'package:microsoft_graph_api/models/mail/recipient_model.dart';

part 'message_create_request_model.g.dart';

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

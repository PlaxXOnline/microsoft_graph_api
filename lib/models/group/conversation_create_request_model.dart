import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/mail/mail_models.dart';

part 'conversation_create_request_model.g.dart';

/// Request model for creating a new conversation in a group.
@JsonSerializable()
class ConversationCreateRequest {
  /// The topic (subject) of the conversation.
  final String topic;

  /// The message to post to the conversation.
  final String? message;

  /// The body of the message to post.
  final ItemBody? body;
  
  /// The recipients to include in the conversation.
  final List<Recipient>? recipients;

  ConversationCreateRequest({
    required this.topic,
    this.message,
    this.body,
    this.recipients,
  });

  factory ConversationCreateRequest.fromJson(Map<String, dynamic> json) => _$ConversationCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationCreateRequestToJson(this);
}

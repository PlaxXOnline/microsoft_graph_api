import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/group/conversation_thread_model.dart';

part 'group_conversation_model.g.dart';

/// Represents a group conversation in Microsoft Graph API.
@JsonSerializable()
class GroupConversation {
  /// The unique identifier for the conversation.
  final String? id;
  
  /// The topic of the conversation.
  final String? topic;
  
  /// If true, indicates that the conversation has attachments.
  final bool? hasAttachments;
  
  /// All unique senders in the conversation.
  final List<String>? uniqueSenders;
  
  /// The timestamp of the conversation's last delivered post.
  final DateTime? lastDeliveredDateTime;
  
  /// Preview of the conversation.
  final String? preview;
  
  /// The threads attached to the conversation.
  final List<ConversationThread>? threads;

  GroupConversation({
    this.id,
    this.topic,
    this.hasAttachments,
    this.uniqueSenders,
    this.lastDeliveredDateTime,
    this.preview,
    this.threads,
  });

  const GroupConversation.empty()
      : id = null,
        topic = null,
        hasAttachments = null,
        uniqueSenders = null,
        lastDeliveredDateTime = null,
        preview = null,
        threads = null;

  factory GroupConversation.fromJson(Map<String, dynamic> json) => _$GroupConversationFromJson(json);
  Map<String, dynamic> toJson() => _$GroupConversationToJson(this);
}

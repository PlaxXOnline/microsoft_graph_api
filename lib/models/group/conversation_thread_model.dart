import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/group/post_model.dart';

part 'conversation_thread_model.g.dart';

/// Represents a thread in a group conversation.
@JsonSerializable()
class ConversationThread {
  /// The unique identifier for the thread.
  final String? id;
  
  /// The topic of the thread.
  final String? topic;
  
  /// Indicates whether the thread has attachments.
  final bool? hasAttachments;
  
  /// The timestamp for when the thread was last delivered.
  final DateTime? lastDeliveredDateTime;
  
  /// The preview text of the thread.
  final String? preview;
  
  /// If the thread is locked.
  final bool? isLocked;
  
  /// The posts in this thread.
  final List<Post>? posts;

  ConversationThread({
    this.id,
    this.topic,
    this.hasAttachments,
    this.lastDeliveredDateTime,
    this.preview,
    this.isLocked,
    this.posts,
  });

  const ConversationThread.empty()
      : id = null,
        topic = null,
        hasAttachments = null,
        lastDeliveredDateTime = null,
        preview = null,
        isLocked = null,
        posts = null;

  factory ConversationThread.fromJson(Map<String, dynamic> json) => _$ConversationThreadFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationThreadToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/mail/mail_models.dart';

part 'post_model.g.dart';

/// Represents a post in a conversation thread.
@JsonSerializable()
class Post {
  /// The unique identifier for the post.
  final String? id;
  
  /// The sender of the post.
  final Recipient? sender;
  
  /// The recipients of the post.
  final List<Recipient>? recipients;
  
  /// The subject of the post.
  final String? subject;
  
  /// The body of the post.
  final ItemBody? body;
  
  /// The date and time when the post was created.
  final DateTime? createdDateTime;
  
  /// The date and time when the post was last modified.
  final DateTime? lastModifiedDateTime;
  
  /// The categories associated with the post.
  final List<String>? categories;
  
  /// The changes that have been made to the post.
  final List<String>? changeKey;
  
  /// Indicates whether the post has attachments.
  final bool? hasAttachments;
  
  /// The importance of the post.
  final String? importance;
  
  /// The unique ID of the conversation.
  final String? conversationId;
  
  /// The unique ID of the conversation thread.
  final String? conversationThreadId;

  Post({
    this.id,
    this.sender,
    this.recipients,
    this.subject,
    this.body,
    this.createdDateTime,
    this.lastModifiedDateTime,
    this.categories,
    this.changeKey,
    this.hasAttachments,
    this.importance,
    this.conversationId,
    this.conversationThreadId,
  });

  const Post.empty()
      : id = null,
        sender = null,
        recipients = null,
        subject = null,
        body = null,
        createdDateTime = null,
        lastModifiedDateTime = null,
        categories = null,
        changeKey = null,
        hasAttachments = null,
        importance = null,
        conversationId = null,
        conversationThreadId = null;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

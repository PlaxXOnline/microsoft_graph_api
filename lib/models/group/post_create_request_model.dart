import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/mail/mail_models.dart';

part 'post_create_request_model.g.dart';

/// Request model for creating a new post in a conversation thread.
@JsonSerializable()
class PostCreateRequest {
  /// The body of the post.
  final ItemBody? body;
  
  /// The categories associated with the post.
  final List<String>? categories;
  
  /// The importance of the post (low, normal, high).
  final String? importance;
  
  /// The recipients of the post.
  final List<Recipient>? recipients;
  
  /// The subject of the post.
  final String? subject;

  PostCreateRequest({
    this.body,
    this.categories,
    this.importance,
    this.recipients,
    this.subject,
  });

  factory PostCreateRequest.fromJson(Map<String, dynamic> json) => _$PostCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PostCreateRequestToJson(this);
}

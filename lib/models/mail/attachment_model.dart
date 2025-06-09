import 'package:json_annotation/json_annotation.dart';

part 'attachment_model.g.dart';

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

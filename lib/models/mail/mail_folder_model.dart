import 'package:json_annotation/json_annotation.dart';

part 'mail_folder_model.g.dart';

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

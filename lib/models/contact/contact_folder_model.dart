/// Represents a contact folder in the Microsoft Graph API.
class ContactFolder {
  /// The folder's display name.
  final String? displayName;

  /// Unique identifier of the contact folder. Read-only.
  final String? id;

  /// The ID of the folder's parent folder.
  final String? parentFolderId;

  ContactFolder({this.displayName, this.id, this.parentFolderId});

  /// Creates a new instance of [ContactFolder] from a JSON object.
  factory ContactFolder.fromJson(Map<String, dynamic> json) {
    return ContactFolder(
      displayName: json['displayName'],
      id: json['id'],
      parentFolderId: json['parentFolderId'],
    );
  }

  /// Doesn't support setting null values for the properties.
  ContactFolder copyWith({
    String? displayName,
    String? id,
    String? parentFolderId,
  }) {
    return ContactFolder(
      displayName: displayName ?? this.displayName,
      id: id ?? this.id,
      parentFolderId: parentFolderId ?? this.parentFolderId,
    );
  }

  @override
  String toString() =>
      'ContactFolder(displayName: $displayName, id: $id, parentFolderId: $parentFolderId)';
}

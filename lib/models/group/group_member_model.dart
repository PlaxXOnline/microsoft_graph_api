import 'package:json_annotation/json_annotation.dart';

part 'group_member_model.g.dart';

/// Represents a member of a group.
@JsonSerializable()
class GroupMember {
  /// The unique identifier of the member.
  final String? id;
  
  /// The display name of the member.
  final String? displayName;
  
  /// The user principal name of the member.
  final String? userPrincipalName;
  
  /// The email address of the member.
  final String? mail;

  GroupMember({
    this.id,
    this.displayName,
    this.userPrincipalName,
    this.mail,
  });

  const GroupMember.empty()
      : id = null,
        displayName = null,
        userPrincipalName = null,
        mail = null;

  factory GroupMember.fromJson(Map<String, dynamic> json) => _$GroupMemberFromJson(json);
  Map<String, dynamic> toJson() => _$GroupMemberToJson(this);
}

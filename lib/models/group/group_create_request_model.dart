import 'package:json_annotation/json_annotation.dart';

part 'group_create_request_model.g.dart';

/// Request model for creating a new group.
@JsonSerializable()
class GroupCreateRequest {
  /// The display name for the group.
  final String displayName;

  /// The mail nickname for the group.
  final String mailNickname;

  /// The description of the group.
  final String? description;

  /// The owners of the group.
  final List<String>? owners;

  /// The members of the group.
  final List<String>? members;

  /// The group types.
  final List<String>? groupTypes;

  /// Whether the group is mail enabled.
  final bool? mailEnabled;

  /// Whether the group is security enabled.
  final bool? securityEnabled;

  /// The visibility of the group.
  final String? visibility;

  /// The group's preferred language.
  final String? preferredLanguage;

  GroupCreateRequest({
    required this.displayName,
    required this.mailNickname,
    this.description,
    this.owners,
    this.members,
    this.groupTypes,
    this.mailEnabled,
    this.securityEnabled,
    this.visibility,
    this.preferredLanguage,
  });

  factory GroupCreateRequest.fromJson(Map<String, dynamic> json) => _$GroupCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GroupCreateRequestToJson(this);
}

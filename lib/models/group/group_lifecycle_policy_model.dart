import 'package:json_annotation/json_annotation.dart';

part 'group_lifecycle_policy_model.g.dart';

/// Represents a lifecycle policy for groups.
@JsonSerializable()
class GroupLifecyclePolicy {
  /// The unique identifier for the policy.
  final String? id;
  
  /// The display name of the policy.
  final String? displayName;
  
  /// The number of days before a group expires.
  final int? groupLifetimeInDays;
  
  /// The types of groups the policy applies to.
  final List<String>? managedGroupTypes;
  
  /// The actions to take when a group expires.
  final List<String>? alternateNotificationEmails;

  GroupLifecyclePolicy({
    this.id,
    this.displayName,
    this.groupLifetimeInDays,
    this.managedGroupTypes,
    this.alternateNotificationEmails,
  });

  const GroupLifecyclePolicy.empty()
      : id = null,
        displayName = null,
        groupLifetimeInDays = null,
        managedGroupTypes = null,
        alternateNotificationEmails = null;

  factory GroupLifecyclePolicy.fromJson(Map<String, dynamic> json) => _$GroupLifecyclePolicyFromJson(json);
  Map<String, dynamic> toJson() => _$GroupLifecyclePolicyToJson(this);
}

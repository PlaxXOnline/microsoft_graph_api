import 'package:json_annotation/json_annotation.dart';

part 'followup_flag_model.g.dart';

/// Represents a flag to follow up on a message.
@JsonSerializable()
class FollowupFlag {
  /// The status of the flag. Possible values are: notFlagged, complete, flagged.
  final String? flagStatus;

  /// The date and time when the follow-up was completed.
  final DateTime? completedDateTime;

  /// The date and time when the follow-up is due.
  final DateTime? dueDateTime;

  /// The date and time when the follow-up is scheduled to start.
  final DateTime? startDateTime;

  FollowupFlag({
    this.flagStatus,
    this.completedDateTime,
    this.dueDateTime,
    this.startDateTime,
  });

  const FollowupFlag.empty()
      : flagStatus = null,
        completedDateTime = null,
        dueDateTime = null,
        startDateTime = null;

  factory FollowupFlag.fromJson(Map<String, dynamic> json) => _$FollowupFlagFromJson(json);
  Map<String, dynamic> toJson() => _$FollowupFlagToJson(this);
}

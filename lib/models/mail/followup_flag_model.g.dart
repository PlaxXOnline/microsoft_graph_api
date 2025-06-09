// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followup_flag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowupFlag _$FollowupFlagFromJson(Map<String, dynamic> json) => FollowupFlag(
      flagStatus: json['flagStatus'] as String?,
      completedDateTime: json['completedDateTime'] == null
          ? null
          : DateTime.parse(json['completedDateTime'] as String),
      dueDateTime: json['dueDateTime'] == null
          ? null
          : DateTime.parse(json['dueDateTime'] as String),
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
    );

Map<String, dynamic> _$FollowupFlagToJson(FollowupFlag instance) =>
    <String, dynamic>{
      'flagStatus': instance.flagStatus,
      'completedDateTime': instance.completedDateTime?.toIso8601String(),
      'dueDateTime': instance.dueDateTime?.toIso8601String(),
      'startDateTime': instance.startDateTime?.toIso8601String(),
    };

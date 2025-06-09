// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoTaskList _$TodoTaskListFromJson(Map<String, dynamic> json) => TodoTaskList(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      isOwner: json['isOwner'] as bool?,
      isShared: json['isShared'] as bool?,
      wellknownListName: json['wellknownListName'] as String?,
    );

Map<String, dynamic> _$TodoTaskListToJson(TodoTaskList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'isOwner': instance.isOwner,
      'isShared': instance.isShared,
      'wellknownListName': instance.wellknownListName,
    };

Map<String, dynamic> _$TaskListCreateRequestToJson(
        TaskListCreateRequest instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
    };

Map<String, dynamic> _$TaskListUpdateRequestToJson(
        TaskListUpdateRequest instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
    };

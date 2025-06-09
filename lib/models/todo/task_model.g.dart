// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoTask _$TodoTaskFromJson(Map<String, dynamic> json) => TodoTask(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      status: json['status'] as String?,
      importance: json['importance'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      hasRecurrence: json['hasRecurrence'] as bool?,
      createdDateTime: json['createdDateTime'] as String?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      dueDateTime: json['dueDateTime'] as String?,
      completedDateTime: json['completedDateTime'] as String?,
      parentListId: json['parentListId'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      recurrence: json['recurrence'] == null
          ? null
          : RecurrencePattern.fromJson(
              json['recurrence'] as Map<String, dynamic>),
      extensions: json['extensions'] as Map<String, dynamic>?,
      linkedResources: json['linkedResources'] == null
          ? null
          : LinkedResources.fromJson(
              json['linkedResources'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodoTaskToJson(TodoTask instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'status': instance.status,
      'importance': instance.importance,
      'isCompleted': instance.isCompleted,
      'hasRecurrence': instance.hasRecurrence,
      'createdDateTime': instance.createdDateTime,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'dueDateTime': instance.dueDateTime,
      'completedDateTime': instance.completedDateTime,
      'parentListId': instance.parentListId,
      'categories': instance.categories,
      'recurrence': instance.recurrence,
      'extensions': instance.extensions,
      'linkedResources': instance.linkedResources,
    };

RecurrencePattern _$RecurrencePatternFromJson(Map<String, dynamic> json) =>
    RecurrencePattern(
      type: json['type'] as String?,
      interval: (json['interval'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      dayOfMonth: (json['dayOfMonth'] as num?)?.toInt(),
      daysOfWeek: json['daysOfWeek'] as String?,
      firstDayOfWeek: json['firstDayOfWeek'] as String?,
      index: json['index'] as String?,
    );

Map<String, dynamic> _$RecurrencePatternToJson(RecurrencePattern instance) =>
    <String, dynamic>{
      'type': instance.type,
      'interval': instance.interval,
      'month': instance.month,
      'dayOfMonth': instance.dayOfMonth,
      'daysOfWeek': instance.daysOfWeek,
      'firstDayOfWeek': instance.firstDayOfWeek,
      'index': instance.index,
    };

LinkedResources _$LinkedResourcesFromJson(Map<String, dynamic> json) =>
    LinkedResources(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => LinkedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinkedResourcesToJson(LinkedResources instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

LinkedResource _$LinkedResourceFromJson(Map<String, dynamic> json) =>
    LinkedResource(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      webUrl: json['webUrl'] as String?,
      applicationName: json['applicationName'] as String?,
      externalId: json['externalId'] as String?,
    );

Map<String, dynamic> _$LinkedResourceToJson(LinkedResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'webUrl': instance.webUrl,
      'applicationName': instance.applicationName,
      'externalId': instance.externalId,
    };

Map<String, dynamic> _$TodoTaskCreateRequestToJson(
        TodoTaskCreateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'importance': instance.importance,
      'dueDateTime': instance.dueDateTime,
      'isCompleted': instance.isCompleted,
    };

Map<String, dynamic> _$TodoTaskUpdateRequestToJson(
        TodoTaskUpdateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'importance': instance.importance,
      'dueDateTime': instance.dueDateTime,
      'isCompleted': instance.isCompleted,
    };

Map<String, dynamic> _$LinkedResourceCreateRequestToJson(
        LinkedResourceCreateRequest instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'webUrl': instance.webUrl,
      'applicationName': instance.applicationName,
      'externalId': instance.externalId,
    };

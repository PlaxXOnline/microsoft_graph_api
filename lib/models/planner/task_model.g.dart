// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannerTask _$PlannerTaskFromJson(Map<String, dynamic> json) => PlannerTask(
      id: json['id'] as String?,
      title: json['title'] as String?,
      planId: json['planId'] as String?,
      bucketId: json['bucketId'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      checklistItemCount: (json['checklistItemCount'] as num?)?.toInt(),
      activeChecklistItemCount:
          (json['activeChecklistItemCount'] as num?)?.toInt(),
      percentComplete: (json['percentComplete'] as num?)?.toInt(),
      dueDateTime: json['dueDateTime'] as String?,
      createdDateTime: json['createdDateTime'] as String?,
      startDateTime: json['startDateTime'] as String?,
      completedDateTime: json['completedDateTime'] as String?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      completedBy: json['completedBy'] as String?,
      appliedCategories:
          (json['appliedCategories'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      assignments: (json['assignments'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TaskAssignment.fromJson(e as Map<String, dynamic>)),
      ),
      previewType: json['previewType'] as String?,
      completed: json['completed'] as bool?,
      referenceCount: json['referenceCount'] as String?,
      assigneePriority: json['assigneePriority'] as String?,
      orderHint: json['orderHint'] as String?,
      details: json['details'] == null
          ? null
          : PlannerTaskDetails.fromJson(
              json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlannerTaskToJson(PlannerTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'planId': instance.planId,
      'bucketId': instance.bucketId,
      'priority': instance.priority,
      'checklistItemCount': instance.checklistItemCount,
      'activeChecklistItemCount': instance.activeChecklistItemCount,
      'percentComplete': instance.percentComplete,
      'dueDateTime': instance.dueDateTime,
      'createdDateTime': instance.createdDateTime,
      'startDateTime': instance.startDateTime,
      'completedDateTime': instance.completedDateTime,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'completedBy': instance.completedBy,
      'appliedCategories': instance.appliedCategories,
      'assignments': instance.assignments,
      'previewType': instance.previewType,
      'completed': instance.completed,
      'referenceCount': instance.referenceCount,
      'assigneePriority': instance.assigneePriority,
      'orderHint': instance.orderHint,
      'details': instance.details,
    };

TaskAssignment _$TaskAssignmentFromJson(Map<String, dynamic> json) =>
    TaskAssignment(
      assignedBy: json['assignedBy'] as String?,
      assignedDateTime: json['assignedDateTime'] as String?,
      orderHint: json['orderHint'] as String?,
    );

Map<String, dynamic> _$TaskAssignmentToJson(TaskAssignment instance) =>
    <String, dynamic>{
      'assignedBy': instance.assignedBy,
      'assignedDateTime': instance.assignedDateTime,
      'orderHint': instance.orderHint,
    };

PlannerTaskDetails _$PlannerTaskDetailsFromJson(Map<String, dynamic> json) =>
    PlannerTaskDetails(
      description: json['description'] as String?,
      id: json['id'] as String?,
      previewType: json['previewType'] as String?,
      checklist: (json['checklist'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ChecklistItem.fromJson(e as Map<String, dynamic>)),
      ),
      references: (json['references'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ExternalReference.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PlannerTaskDetailsToJson(PlannerTaskDetails instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'previewType': instance.previewType,
      'checklist': instance.checklist,
      'references': instance.references,
    };

ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    ChecklistItem(
      isChecked: json['isChecked'] as bool?,
      title: json['title'] as String?,
      createdDateTime: json['createdDateTime'] as String?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      orderHint: json['orderHint'] as String?,
    );

Map<String, dynamic> _$ChecklistItemToJson(ChecklistItem instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'title': instance.title,
      'createdDateTime': instance.createdDateTime,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'lastModifiedBy': instance.lastModifiedBy,
      'orderHint': instance.orderHint,
    };

ExternalReference _$ExternalReferenceFromJson(Map<String, dynamic> json) =>
    ExternalReference(
      alias: json['alias'] as String?,
      type: json['type'] as String?,
      previewPriority: json['previewPriority'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
    );

Map<String, dynamic> _$ExternalReferenceToJson(ExternalReference instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'type': instance.type,
      'previewPriority': instance.previewPriority,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
    };

Map<String, dynamic> _$TaskCreateRequestToJson(TaskCreateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'planId': instance.planId,
      'bucketId': instance.bucketId,
      'assignments': instance.assignments,
      'priority': instance.priority,
      'dueDateTime': instance.dueDateTime,
      'startDateTime': instance.startDateTime,
    };

Map<String, dynamic> _$TaskAssignmentRequestToJson(
        TaskAssignmentRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$TaskUpdateRequestToJson(TaskUpdateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'bucketId': instance.bucketId,
      'completedBy': instance.completedBy,
      'percentComplete': instance.percentComplete,
      'priority': instance.priority,
      'dueDateTime': instance.dueDateTime,
      'startDateTime': instance.startDateTime,
    };

Map<String, dynamic> _$TaskDetailsUpdateRequestToJson(
        TaskDetailsUpdateRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'checklist': instance.checklist,
      'references': instance.references,
    };

Map<String, dynamic> _$ChecklistItemRequestToJson(
        ChecklistItemRequest instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'title': instance.title,
    };

Map<String, dynamic> _$ExternalReferenceRequestToJson(
        ExternalReferenceRequest instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'type': instance.type,
    };

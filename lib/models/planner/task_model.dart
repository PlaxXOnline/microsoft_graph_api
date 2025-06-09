import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

/// Represents a task in Microsoft Planner.
@JsonSerializable()
class PlannerTask {
  /// The unique identifier of the task.
  final String? id;

  /// The title of the task.
  final String? title;

  /// The ID of the plan that contains the task.
  final String? planId;

  /// The ID of the bucket that contains the task.
  final String? bucketId;

  /// The task's priority value between 0 and 10 (higher value = higher priority).
  final int? priority;

  /// The number of checklist items in the task.
  final int? checklistItemCount;

  /// The number of checklist items that are completed.
  final int? activeChecklistItemCount;

  /// The percentage of the task that is complete (0-100).
  final int? percentComplete;

  /// The date and time when the task is due.
  final String? dueDateTime;

  /// The date and time when the task was created.
  final String? createdDateTime;

  /// The date when the task was started.
  final String? startDateTime;

  /// The date and time when the task was completed.
  final String? completedDateTime;

  /// A date and time type value that indicates when the task was last modified.
  final String? lastModifiedDateTime;

  /// The date and time when the task was completed.
  final String? completedBy;

  /// A set of category key-value pairs for the task.
  final Map<String, bool>? appliedCategories;

  /// The user IDs of users assigned to the task.
  final Map<String, TaskAssignment>? assignments;

  /// The URL to view the task in the Microsoft Planner UI.
  final String? previewType;

  /// Indicates if the task is completed or not.
  final bool? completed;

  /// The URL of a preview image for the task.
  final String? referenceCount;

  /// The ID of the task assigned for the label.
  final String? assigneePriority;

  /// The ID of the user who created the task.
  final String? orderHint;

  /// Additional details about the task.
  final PlannerTaskDetails? details;

  /// Creates a new PlannerTask instance.
  PlannerTask({
    this.id,
    this.title,
    this.planId,
    this.bucketId,
    this.priority,
    this.checklistItemCount,
    this.activeChecklistItemCount,
    this.percentComplete,
    this.dueDateTime,
    this.createdDateTime,
    this.startDateTime,
    this.completedDateTime,
    this.lastModifiedDateTime,
    this.completedBy,
    this.appliedCategories,
    this.assignments,
    this.previewType,
    this.completed,
    this.referenceCount,
    this.assigneePriority,
    this.orderHint,
    this.details,
  });

  /// Creates a PlannerTask instance from JSON data.
  factory PlannerTask.fromJson(Map<String, dynamic> json) => _$PlannerTaskFromJson(json);

  /// Converts this PlannerTask instance to JSON data.
  Map<String, dynamic> toJson() => _$PlannerTaskToJson(this);
}

/// Represents an assignment of a task to a user in Microsoft Planner.
@JsonSerializable()
class TaskAssignment {
  /// The user ID for the assigned user.
  final String? assignedBy;

  /// The time when the task was assigned to the user.
  final String? assignedDateTime;

  /// The order hint used to determine the order of assignments in a task.
  final String? orderHint;

  /// Creates a new TaskAssignment instance.
  TaskAssignment({
    this.assignedBy,
    this.assignedDateTime,
    this.orderHint,
  });

  /// Creates a TaskAssignment instance from JSON data.
  factory TaskAssignment.fromJson(Map<String, dynamic> json) => _$TaskAssignmentFromJson(json);

  /// Converts this TaskAssignment instance to JSON data.
  Map<String, dynamic> toJson() => _$TaskAssignmentToJson(this);
}

/// Represents additional information about a task in Microsoft Planner.
@JsonSerializable()
class PlannerTaskDetails {
  /// The description of the task.
  final String? description;

  /// The ID of the task details.
  final String? id;

  /// The reference preview URL of the task.
  final String? previewType;

  /// A collection of checklist items on the task.
  final Map<String, ChecklistItem>? checklist;

  /// A collection of references (URLs and notes) for the task.
  final Map<String, ExternalReference>? references;

  /// Creates a new PlannerTaskDetails instance.
  PlannerTaskDetails({
    this.description,
    this.id,
    this.previewType,
    this.checklist,
    this.references,
  });

  /// Creates a PlannerTaskDetails instance from JSON data.
  factory PlannerTaskDetails.fromJson(Map<String, dynamic> json) => _$PlannerTaskDetailsFromJson(json);

  /// Converts this PlannerTaskDetails instance to JSON data.
  Map<String, dynamic> toJson() => _$PlannerTaskDetailsToJson(this);
}

/// Represents a checklist item in a task.
@JsonSerializable()
class ChecklistItem {
  /// Whether the checklist item is checked off.
  final bool? isChecked;

  /// The title of the checklist item.
  final String? title;

  /// The time when the item was created.
  final String? createdDateTime;

  /// The time when the item was last modified.
  final String? lastModifiedDateTime;

  /// The ID of the user who created the item.
  final String? lastModifiedBy;

  /// The order of the item in the checklist.
  final String? orderHint;

  /// Creates a new ChecklistItem instance.
  ChecklistItem({
    this.isChecked,
    this.title,
    this.createdDateTime,
    this.lastModifiedDateTime,
    this.lastModifiedBy,
    this.orderHint,
  });

  /// Creates a ChecklistItem instance from JSON data.
  factory ChecklistItem.fromJson(Map<String, dynamic> json) => _$ChecklistItemFromJson(json);

  /// Converts this ChecklistItem instance to JSON data.
  Map<String, dynamic> toJson() => _$ChecklistItemToJson(this);
}

/// Represents an external reference in a task.
@JsonSerializable()
class ExternalReference {
  /// The URL to the referenced resource.
  final String? alias;

  /// The type of the reference. Possible values are: file, url, notes.
  final String? type;

  /// The URL to go to in Microsoft Planner to see the referenced item.
  final String? previewPriority;

  /// The title of the reference.
  final String? lastModifiedBy;

  /// The time when the reference was last modified.
  final String? lastModifiedDateTime;

  /// Creates a new ExternalReference instance.
  ExternalReference({
    this.alias,
    this.type,
    this.previewPriority,
    this.lastModifiedBy,
    this.lastModifiedDateTime,
  });

  /// Creates an ExternalReference instance from JSON data.
  factory ExternalReference.fromJson(Map<String, dynamic> json) => _$ExternalReferenceFromJson(json);

  /// Converts this ExternalReference instance to JSON data.
  Map<String, dynamic> toJson() => _$ExternalReferenceToJson(this);
}

/// Request model for creating a new task.
@JsonSerializable(createFactory: false)
class TaskCreateRequest {
  /// The title of the task.
  final String title;

  /// The ID of the plan the task belongs to.
  final String planId;

  /// The ID of the bucket the task belongs to.
  final String bucketId;

  /// The user ID of users assigned to the task.
  final Map<String, TaskAssignmentRequest>? assignments;

  /// The task's priority (0-10).
  final int? priority;

  /// The date and time when the task is due.
  final String? dueDateTime;

  /// The date when the task starts.
  final String? startDateTime;

  /// Creates a new TaskCreateRequest instance.
  TaskCreateRequest({
    required this.title,
    required this.planId,
    required this.bucketId,
    this.assignments,
    this.priority,
    this.dueDateTime,
    this.startDateTime,
  });

  /// Converts this TaskCreateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$TaskCreateRequestToJson(this);
}

/// Request model for task assignments.
@JsonSerializable(createFactory: false)
class TaskAssignmentRequest {
  /// Creates a new TaskAssignmentRequest instance.
  TaskAssignmentRequest();

  /// Converts this TaskAssignmentRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$TaskAssignmentRequestToJson(this);
}

/// Request model for updating a task.
@JsonSerializable(createFactory: false)
class TaskUpdateRequest {
  /// The new title of the task.
  final String? title;

  /// The new bucket ID for the task.
  final String? bucketId;

  /// The ID of the user who completed the task.
  final String? completedBy;

  /// The percentage of the task that is complete.
  final int? percentComplete;

  /// The priority of the task.
  final int? priority;
  
  /// The date and time when the task is due.
  final String? dueDateTime;

  /// The date and time when the task starts.
  final String? startDateTime;

  /// Creates a new TaskUpdateRequest instance.
  TaskUpdateRequest({
    this.title,
    this.bucketId,
    this.completedBy,
    this.percentComplete,
    this.priority,
    this.dueDateTime,
    this.startDateTime,
  });

  /// Converts this TaskUpdateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$TaskUpdateRequestToJson(this);
}

/// Request model for updating task details.
@JsonSerializable(createFactory: false)
class TaskDetailsUpdateRequest {
  /// The description of the task.
  final String? description;
  
  /// The checklist items to update.
  final Map<String, ChecklistItemRequest>? checklist;
  
  /// The references to update.
  final Map<String, ExternalReferenceRequest>? references;

  /// Creates a new TaskDetailsUpdateRequest instance.
  TaskDetailsUpdateRequest({
    this.description,
    this.checklist,
    this.references,
  });

  /// Converts this TaskDetailsUpdateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$TaskDetailsUpdateRequestToJson(this);
}

/// Request model for checklist item updates.
@JsonSerializable(createFactory: false)
class ChecklistItemRequest {
  /// Whether the checklist item is checked off.
  final bool? isChecked;

  /// The title of the checklist item.
  final String? title;

  /// Creates a new ChecklistItemRequest instance.
  ChecklistItemRequest({
    this.isChecked,
    this.title,
  });

  /// Converts this ChecklistItemRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$ChecklistItemRequestToJson(this);
}

/// Request model for external reference updates.
@JsonSerializable(createFactory: false)
class ExternalReferenceRequest {
  /// The alias of the external reference.
  final String? alias;

  /// The type of the external reference.
  final String? type;

  /// Creates a new ExternalReferenceRequest instance.
  ExternalReferenceRequest({
    this.alias,
    this.type,
  });

  /// Converts this ExternalReferenceRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$ExternalReferenceRequestToJson(this);
}

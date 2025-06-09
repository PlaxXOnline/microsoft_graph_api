import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

/// Represents a task in Microsoft To Do.
@JsonSerializable()
class TodoTask {
  /// The unique identifier of the task.
  final String? id;

  /// The title of the task.
  final String? title;

  /// The detailed description of the task.
  final String? body;

  /// The status of the task.
  final String? status;

  /// The importance of the task.
  final String? importance;

  /// Flag indicating whether the task has been completed.
  final bool? isCompleted;

  /// Flag indicating whether the task is recurring.
  final bool? hasRecurrence;

  /// Time when the task was created.
  final String? createdDateTime;

  /// Time when the task was last modified.
  final String? lastModifiedDateTime;

  /// The date and time when the task is due.
  final String? dueDateTime;

  /// The date and time when the task should be completed.
  final String? completedDateTime;

  /// The ID of the task list that contains the task.
  final String? parentListId;

  /// Collection of categories associated with the task.
  final List<String>? categories;

  /// The task's recurrence pattern.
  final RecurrencePattern? recurrence;

  /// Custom properties for the task.
  final Map<String, dynamic>? extensions;

  /// Links related to the task.
  final LinkedResources? linkedResources;

  /// Creates a new TodoTask instance.
  TodoTask({
    this.id,
    this.title,
    this.body,
    this.status,
    this.importance,
    this.isCompleted,
    this.hasRecurrence,
    this.createdDateTime,
    this.lastModifiedDateTime,
    this.dueDateTime,
    this.completedDateTime,
    this.parentListId,
    this.categories,
    this.recurrence,
    this.extensions,
    this.linkedResources,
  });

  /// Creates a TodoTask instance from a JSON object.
  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);

  /// Converts this TodoTask instance to a JSON object.
  Map<String, dynamic> toJson() => _$TodoTaskToJson(this);
}

/// Represents the recurrence pattern of a task.
@JsonSerializable()
class RecurrencePattern {
  /// The type of recurrence (daily, weekly, monthly, yearly).
  final String? type;

  /// The interval between occurrences.
  final int? interval;

  /// The month of the year for the recurrence (1-12).
  final int? month;

  /// The day of the month for the recurrence (1-31).
  final int? dayOfMonth;

  /// The day of the week for the recurrence (Sunday to Saturday).
  final String? daysOfWeek;

  /// The first day of the week.
  final String? firstDayOfWeek;

  /// The index of the week in the month (first, second, third, fourth, last).
  final String? index;

  /// Creates a new RecurrencePattern instance.
  RecurrencePattern({
    this.type,
    this.interval,
    this.month,
    this.dayOfMonth,
    this.daysOfWeek,
    this.firstDayOfWeek,
    this.index,
  });

  /// Creates a RecurrencePattern instance from a JSON object.
  factory RecurrencePattern.fromJson(Map<String, dynamic> json) =>
      _$RecurrencePatternFromJson(json);

  /// Converts this RecurrencePattern instance to a JSON object.
  Map<String, dynamic> toJson() => _$RecurrencePatternToJson(this);
}

/// Represents linked resources for a task.
@JsonSerializable()
class LinkedResources {
  /// The collection of linked resources.
  final List<LinkedResource>? value;

  /// Creates a new LinkedResources instance.
  LinkedResources({this.value});

  /// Creates a LinkedResources instance from a JSON object.
  factory LinkedResources.fromJson(Map<String, dynamic> json) =>
      _$LinkedResourcesFromJson(json);

  /// Converts this LinkedResources instance to a JSON object.
  Map<String, dynamic> toJson() => _$LinkedResourcesToJson(this);
}

/// Represents a linked resource for a task.
@JsonSerializable()
class LinkedResource {
  /// The unique identifier of the linked resource.
  final String? id;

  /// The title of the link.
  final String? displayName;

  /// The URL of the link.
  final String? webUrl;

  /// The application name of the link source.
  final String? applicationName;

  /// The external ID of the link.
  final String? externalId;

  /// Creates a new LinkedResource instance.
  LinkedResource({
    this.id,
    this.displayName,
    this.webUrl,
    this.applicationName,
    this.externalId,
  });

  /// Creates a LinkedResource instance from a JSON object.
  factory LinkedResource.fromJson(Map<String, dynamic> json) =>
      _$LinkedResourceFromJson(json);

  /// Converts this LinkedResource instance to a JSON object.
  Map<String, dynamic> toJson() => _$LinkedResourceToJson(this);
}

/// Request model for creating a new task.
@JsonSerializable(createFactory: false)
class TodoTaskCreateRequest {
  /// The title of the task.
  final String title;

  /// The detailed description of the task.
  final String? body;

  /// The importance of the task (low, normal, high).
  final String? importance;

  /// The date and time when the task is due.
  final String? dueDateTime;

  /// Flag indicating whether the task is marked as completed.
  final bool? isCompleted;

  /// Creates a new TodoTaskCreateRequest instance.
  TodoTaskCreateRequest({
    required this.title,
    this.body,
    this.importance,
    this.dueDateTime,
    this.isCompleted,
  });

  /// Converts this TodoTaskCreateRequest instance to a JSON object.
  Map<String, dynamic> toJson() => _$TodoTaskCreateRequestToJson(this);
}

/// Request model for updating a task.
@JsonSerializable(createFactory: false)
class TodoTaskUpdateRequest {
  /// The new title of the task.
  final String? title;

  /// The new detailed description of the task.
  final String? body;

  /// The new importance of the task (low, normal, high).
  final String? importance;

  /// The new date and time when the task is due.
  final String? dueDateTime;

  /// Flag indicating whether the task is marked as completed.
  final bool? isCompleted;

  /// Creates a new TodoTaskUpdateRequest instance.
  TodoTaskUpdateRequest({
    this.title,
    this.body,
    this.importance,
    this.dueDateTime,
    this.isCompleted,
  });

  /// Converts this TodoTaskUpdateRequest instance to a JSON object.
  Map<String, dynamic> toJson() => _$TodoTaskUpdateRequestToJson(this);
}

/// Request model for creating a linked resource.
@JsonSerializable(createFactory: false)
class LinkedResourceCreateRequest {
  /// The title of the link.
  final String displayName;

  /// The URL of the link.
  final String webUrl;

  /// The application name of the link source.
  final String? applicationName;

  /// The external ID of the link.
  final String? externalId;

  /// Creates a new LinkedResourceCreateRequest instance.
  LinkedResourceCreateRequest({
    required this.displayName,
    required this.webUrl,
    this.applicationName,
    this.externalId,
  });

  /// Converts this LinkedResourceCreateRequest instance to a JSON object.
  Map<String, dynamic> toJson() => _$LinkedResourceCreateRequestToJson(this);
}

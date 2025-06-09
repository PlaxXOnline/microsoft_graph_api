import 'package:json_annotation/json_annotation.dart';

part 'task_list_model.g.dart';

/// Represents a task list in Microsoft To Do.
@JsonSerializable()
class TodoTaskList {
  /// The unique identifier of the task list.
  final String? id;

  /// The name of the task list.
  final String? displayName;

  /// Value indicating whether the task list is the default task list.
  final bool? isOwner;

  /// Whether this task list is shared with other users.
  final bool? isShared;

  /// The color theme of the task list.
  final String? wellknownListName;

  /// Creates a new TodoTaskList instance.
  TodoTaskList({
    this.id,
    this.displayName,
    this.isOwner,
    this.isShared,
    this.wellknownListName,
  });

  /// Creates a TodoTaskList instance from a JSON object.
  factory TodoTaskList.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskListFromJson(json);

  /// Converts this TodoTaskList instance to a JSON object.
  Map<String, dynamic> toJson() => _$TodoTaskListToJson(this);
}

/// Request model for creating a new task list.
@JsonSerializable(createFactory: false)
class TaskListCreateRequest {
  /// The name of the task list.
  final String displayName;

  /// Creates a new TaskListCreateRequest instance.
  TaskListCreateRequest({
    required this.displayName,
  });

  /// Converts this TaskListCreateRequest instance to a JSON object.
  Map<String, dynamic> toJson() => _$TaskListCreateRequestToJson(this);
}

/// Request model for updating a task list.
@JsonSerializable(createFactory: false)
class TaskListUpdateRequest {
  /// The new name of the task list.
  final String? displayName;

  /// Creates a new TaskListUpdateRequest instance.
  TaskListUpdateRequest({
    this.displayName,
  });

  /// Converts this TaskListUpdateRequest instance to a JSON object.
  Map<String, dynamic> toJson() => _$TaskListUpdateRequestToJson(this);
}

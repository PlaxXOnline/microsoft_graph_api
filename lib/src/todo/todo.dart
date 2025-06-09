import 'dart:convert';

import 'package:dio/dio.dart';
import '../../models/todo/todo_models.dart';

/// Class for interacting with the Microsoft To Do API.
class TodoAPI {
  final String _token;
  final Dio _dio;
  static const String _baseUrl = 'https://graph.microsoft.com/v1.0';

  /// Creates a new instance of the TodoAPI class.
  /// Requires a valid Microsoft Graph API authentication token.
  TodoAPI(this._token) : _dio = Dio();

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      };

  // Task Lists

  /// Gets all task lists for the current user.
  ///
  /// Returns a list of [TodoTaskList] objects.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<List<TodoTaskList>> getTaskLists() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/todo/lists',
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        final List<dynamic> lists = response.data['value'];
        return lists.map((list) => TodoTaskList.fromJson(list)).toList();
      }
      throw _handleError(null, 'Failed to fetch task lists');
    } catch (e) {
      throw _handleError(e, 'Failed to fetch task lists');
    }
  }

  /// Retrieves a task list by its ID.
  ///
  /// [taskListId] is the ID of the task list to retrieve.
  ///
  /// Returns a [TodoTaskList] object.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTaskList> getTaskList(String taskListId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/todo/lists/$taskListId',
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        return TodoTaskList.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to fetch task list: $taskListId');
    } catch (e) {
      throw _handleError(e, 'Failed to fetch task list: $taskListId');
    }
  }

  /// Creates a new task list.
  ///
  /// [request] is a [TaskListCreateRequest] object containing the task list information.
  ///
  /// Returns a [TodoTaskList] object representing the created task list.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTaskList> createTaskList(TaskListCreateRequest request) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/me/todo/lists',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      if (response.statusCode == 201) {
        return TodoTaskList.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to create task list');
    } catch (e) {
      throw _handleError(e, 'Failed to create task list');
    }
  }

  /// Updates an existing task list.
  ///
  /// [taskListId] is the ID of the task list to update.
  /// [request] is a [TaskListUpdateRequest] object containing the updated task list information.
  ///
  /// Returns a [TodoTaskList] object representing the updated task list.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTaskList> updateTaskList(
    String taskListId,
    TaskListUpdateRequest request,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/me/todo/lists/$taskListId',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        return TodoTaskList.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to update task list: $taskListId');
    } catch (e) {
      throw _handleError(e, 'Failed to update task list: $taskListId');
    }
  }

  /// Deletes a task list.
  ///
  /// [taskListId] is the ID of the task list to delete.
  ///
  /// Returns true if the deletion was successful.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<bool> deleteTaskList(String taskListId) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/me/todo/lists/$taskListId',
        options: Options(headers: _headers),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete task list: $taskListId');
    }
  }

  // Tasks operations

  /// Retrieves all tasks in a task list.
  ///
  /// [taskListId] is the ID of the task list containing the tasks.
  ///
  /// Returns a list of [TodoTask] objects.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<List<TodoTask>> getTasks(String taskListId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/todo/lists/$taskListId/tasks',
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        final List<dynamic> tasks = response.data['value'];
        return tasks.map((task) => TodoTask.fromJson(task)).toList();
      }
      throw _handleError(null, 'Failed to fetch tasks for task list: $taskListId');
    } catch (e) {
      throw _handleError(e, 'Failed to fetch tasks for task list: $taskListId');
    }
  }

  /// Retrieves a specific task.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task to retrieve.
  ///
  /// Returns a [TodoTask] object.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTask> getTask(String taskListId, String taskId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId',
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        return TodoTask.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to fetch task: $taskId');
    } catch (e) {
      throw _handleError(e, 'Failed to fetch task: $taskId');
    }
  }

  /// Creates a new task in a task list.
  ///
  /// [taskListId] is the ID of the task list to add the task to.
  /// [request] contains the details of the task to create.
  ///
  /// Returns a [TodoTask] object representing the created task.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTask> createTask(
    String taskListId,
    TodoTaskCreateRequest request,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/me/todo/lists/$taskListId/tasks',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      if (response.statusCode == 201) {
        return TodoTask.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to create task in task list: $taskListId');
    } catch (e) {
      throw _handleError(e, 'Failed to create task in task list: $taskListId');
    }
  }

  /// Updates an existing task.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task to update.
  /// [request] contains the updated details of the task.
  ///
  /// Returns a [TodoTask] object representing the updated task.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTask> updateTask(
    String taskListId,
    String taskId,
    TodoTaskUpdateRequest request,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        return TodoTask.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to update task: $taskId');
    } catch (e) {
      throw _handleError(e, 'Failed to update task: $taskId');
    }
  }

  /// Deletes a task.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task to delete.
  ///
  /// Returns true if the deletion was successful.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<bool> deleteTask(String taskListId, String taskId) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId',
        options: Options(headers: _headers),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete task: $taskId');
    }
  }

  /// Marks a task as completed.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task to mark as completed.
  ///
  /// Returns a [TodoTask] object representing the updated task.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<TodoTask> completeTask(String taskListId, String taskId) async {
    try {
      final updateRequest = TodoTaskUpdateRequest(
        isCompleted: true,
      );

      final response = await _dio.patch(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId',
        data: jsonEncode(updateRequest.toJson()),
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        return TodoTask.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to complete task: $taskId');
    } catch (e) {
      throw _handleError(e, 'Failed to complete task: $taskId');
    }
  }

  /// Linked Resources operations

  /// Retrieves all linked resources for a task.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task.
  ///
  /// Returns a list of [LinkedResource] objects.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<List<LinkedResource>> getLinkedResources(
    String taskListId,
    String taskId,
  ) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId/linkedResources',
        options: Options(headers: _headers),
      );

      if (response.statusCode == 200) {
        final List<dynamic> resources = response.data['value'];
        return resources
            .map((resource) => LinkedResource.fromJson(resource))
            .toList();
      }
      throw _handleError(null, 'Failed to get linked resources for task: $taskId');
    } catch (e) {
      throw _handleError(e, 'Failed to get linked resources for task: $taskId');
    }
  }

  /// Creates a linked resource for a task.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task.
  /// [request] contains the details of the linked resource to create.
  ///
  /// Returns a [LinkedResource] object representing the created linked resource.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<LinkedResource> createLinkedResource(
    String taskListId,
    String taskId,
    LinkedResourceCreateRequest request,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId/linkedResources',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      if (response.statusCode == 201) {
        return LinkedResource.fromJson(response.data);
      }
      throw _handleError(null, 'Failed to create linked resource for task: $taskId');
    } catch (e) {
      throw _handleError(e, 'Failed to create linked resource for task: $taskId');
    }
  }

  /// Deletes a linked resource from a task.
  ///
  /// [taskListId] is the ID of the task list containing the task.
  /// [taskId] is the ID of the task.
  /// [linkedResourceId] is the ID of the linked resource to delete.
  ///
  /// Returns true if the deletion was successful.
  ///
  /// **Required permissions**: Tasks.ReadWrite
  Future<bool> deleteLinkedResource(
    String taskListId,
    String taskId,
    String linkedResourceId,
  ) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/me/todo/lists/$taskListId/tasks/$taskId/linkedResources/$linkedResourceId',
        options: Options(headers: _headers),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete linked resource: $linkedResourceId for task: $taskId');
    }
  }

  // Helper method to handle errors
  Exception _handleError(dynamic error, String message) {
    if (error is DioException) {
      final response = error.response;
      if (response != null) {
        final statusCode = response.statusCode;
        final data = response.data;
        
        String errorMessage = '';
        
        if (data != null && data is Map<String, dynamic>) {
          final errorData = data['error'];
          if (errorData != null && errorData is Map<String, dynamic>) {
            errorMessage = errorData['message'] ?? '';
          }
        }
        
        return Exception('$message. Status: ${statusCode.toString()}. $errorMessage');
      }
      return Exception('$message. ${error.message}');
    } else if (error == null) {
      return Exception(message);
    }
    return Exception('$message. $error');
  }
}

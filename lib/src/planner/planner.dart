import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/planner/planner_models.dart';

/// Provides access to operations on Microsoft Planner through Microsoft Graph API.
class PlannerAPI {
  final String _token;
  final Dio _dio;
  static const String _baseUrl = 'https://graph.microsoft.com/v1.0';

  /// Creates a new instance of the PlannerAPI class.
  /// Requires a valid Microsoft Graph API authentication token.
  PlannerAPI(this._token) : _dio = Dio();

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      };

  // Plans

  /// Gets all plans that the user has access to.
  ///
  /// Returns a list of [Plan] objects.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<List<Plan>> getPlans() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/planner/plans',
        options: Options(headers: _headers),
      );

      final List<dynamic> plansJson = response.data['value'];
      return plansJson.map((json) => Plan.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get plans');
    }
  }

  /// Gets all plans for a specific group.
  ///
  /// [groupId] is the ID of the Microsoft 365 Group.
  ///
  /// Returns a list of [Plan] objects.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<List<Plan>> getGroupPlans(String groupId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/groups/$groupId/planner/plans',
        options: Options(headers: _headers),
      );

      final List<dynamic> plansJson = response.data['value'];
      return plansJson.map((json) => Plan.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get plans for group: $groupId');
    }
  }

  /// Gets a plan by its ID.
  ///
  /// [planId] is the ID of the plan to retrieve.
  ///
  /// Returns a [Plan] object.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<Plan> getPlan(String planId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/plans/$planId',
        options: Options(headers: _headers),
      );

      return Plan.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get plan: $planId');
    }
  }

  /// Gets details for a plan.
  ///
  /// [planId] is the ID of the plan to retrieve details for.
  ///
  /// Returns a [PlanDetails] object.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<PlanDetails> getPlanDetails(String planId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/plans/$planId/details',
        options: Options(headers: _headers),
      );

      return PlanDetails.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get details for plan: $planId');
    }
  }

  /// Creates a new plan.
  ///
  /// [request] is a [PlanCreateRequest] object containing the plan information.
  ///
  /// Returns a [Plan] object representing the created plan.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<Plan> createPlan(PlanCreateRequest request) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/planner/plans',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      return Plan.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to create plan');
    }
  }

  /// Updates an existing plan.
  ///
  /// [planId] is the ID of the plan to update.
  /// [request] is a [PlanUpdateRequest] object containing the updated plan information.
  /// [eTag] is the ETag (entity tag) of the plan, used for concurrency control.
  ///
  /// Returns a [Plan] object representing the updated plan.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<Plan> updatePlan(
    String planId,
    PlanUpdateRequest request,
    String eTag,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/planner/plans/$planId',
        data: jsonEncode(request.toJson()),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return Plan.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to update plan: $planId');
    }
  }

  /// Updates the details of an existing plan.
  ///
  /// [planId] is the ID of the plan to update details for.
  /// [request] is a [PlanDetailsUpdateRequest] object containing the updated details.
  /// [eTag] is the ETag (entity tag) of the plan details, used for concurrency control.
  ///
  /// Returns a [PlanDetails] object representing the updated plan details.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<PlanDetails> updatePlanDetails(
    String planId,
    PlanDetailsUpdateRequest request,
    String eTag,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/planner/plans/$planId/details',
        data: jsonEncode(request.toJson()),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return PlanDetails.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to update details for plan: $planId');
    }
  }

  /// Deletes a plan.
  ///
  /// [planId] is the ID of the plan to delete.
  /// [eTag] is the ETag (entity tag) of the plan, used for concurrency control.
  ///
  /// Returns true if the deletion was successful.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<bool> deletePlan(String planId, String eTag) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/planner/plans/$planId',
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete plan: $planId');
    }
  }

  // Tasks

  /// Gets all tasks in a plan.
  ///
  /// [planId] is the ID of the plan.
  ///
  /// Returns a list of [PlannerTask] objects.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<List<PlannerTask>> getPlanTasks(String planId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/plans/$planId/tasks',
        options: Options(headers: _headers),
      );

      final List<dynamic> tasksJson = response.data['value'];
      return tasksJson.map((json) => PlannerTask.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get tasks for plan: $planId');
    }
  }

  /// Gets a task by its ID.
  ///
  /// [taskId] is the ID of the task to retrieve.
  ///
  /// Returns a [PlannerTask] object.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<PlannerTask> getTask(String taskId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/tasks/$taskId',
        options: Options(headers: _headers),
      );

      return PlannerTask.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get task: $taskId');
    }
  }

  /// Gets details for a task.
  ///
  /// [taskId] is the ID of the task to retrieve details for.
  ///
  /// Returns a [PlannerTaskDetails] object.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<PlannerTaskDetails> getTaskDetails(String taskId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/tasks/$taskId/details',
        options: Options(headers: _headers),
      );

      return PlannerTaskDetails.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get details for task: $taskId');
    }
  }

  /// Creates a new task.
  ///
  /// [request] is a [TaskCreateRequest] object containing the task information.
  ///
  /// Returns a [PlannerTask] object representing the created task.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<PlannerTask> createTask(TaskCreateRequest request) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/planner/tasks',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      return PlannerTask.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to create task');
    }
  }

  /// Updates an existing task.
  ///
  /// [taskId] is the ID of the task to update.
  /// [request] is a [TaskUpdateRequest] object containing the updated task information.
  /// [eTag] is the ETag (entity tag) of the task, used for concurrency control.
  ///
  /// Returns a [PlannerTask] object representing the updated task.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<PlannerTask> updateTask(
    String taskId,
    TaskUpdateRequest request,
    String eTag,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/planner/tasks/$taskId',
        data: jsonEncode(request.toJson()),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return PlannerTask.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to update task: $taskId');
    }
  }

  /// Updates the details of an existing task.
  ///
  /// [taskId] is the ID of the task to update details for.
  /// [request] is a [TaskDetailsUpdateRequest] object containing the updated details.
  /// [eTag] is the ETag (entity tag) of the task details, used for concurrency control.
  ///
  /// Returns a [PlannerTaskDetails] object representing the updated task details.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<PlannerTaskDetails> updateTaskDetails(
    String taskId,
    TaskDetailsUpdateRequest request,
    String eTag,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/planner/tasks/$taskId/details',
        data: jsonEncode(request.toJson()),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return PlannerTaskDetails.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to update details for task: $taskId');
    }
  }

  /// Deletes a task.
  ///
  /// [taskId] is the ID of the task to delete.
  /// [eTag] is the ETag (entity tag) of the task, used for concurrency control.
  ///
  /// Returns true if the deletion was successful.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<bool> deleteTask(String taskId, String eTag) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/planner/tasks/$taskId',
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete task: $taskId');
    }
  }

  // Buckets

  /// Gets all buckets in a plan.
  ///
  /// [planId] is the ID of the plan.
  ///
  /// Returns a list of [PlannerBucket] objects.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<List<PlannerBucket>> getPlanBuckets(String planId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/plans/$planId/buckets',
        options: Options(headers: _headers),
      );

      final List<dynamic> bucketsJson = response.data['value'];
      return bucketsJson.map((json) => PlannerBucket.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get buckets for plan: $planId');
    }
  }

  /// Gets a bucket by its ID.
  ///
  /// [bucketId] is the ID of the bucket to retrieve.
  ///
  /// Returns a [PlannerBucket] object.
  ///
  /// **Required permissions**: Group.Read.All, Group.ReadWrite.All
  Future<PlannerBucket> getBucket(String bucketId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/planner/buckets/$bucketId',
        options: Options(headers: _headers),
      );

      return PlannerBucket.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get bucket: $bucketId');
    }
  }

  /// Creates a new bucket.
  ///
  /// [request] is a [BucketCreateRequest] object containing the bucket information.
  ///
  /// Returns a [PlannerBucket] object representing the created bucket.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<PlannerBucket> createBucket(BucketCreateRequest request) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/planner/buckets',
        data: jsonEncode(request.toJson()),
        options: Options(headers: _headers),
      );

      return PlannerBucket.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to create bucket');
    }
  }

  /// Updates an existing bucket.
  ///
  /// [bucketId] is the ID of the bucket to update.
  /// [request] is a [BucketUpdateRequest] object containing the updated bucket information.
  /// [eTag] is the ETag (entity tag) of the bucket, used for concurrency control.
  ///
  /// Returns a [PlannerBucket] object representing the updated bucket.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<PlannerBucket> updateBucket(
    String bucketId,
    BucketUpdateRequest request,
    String eTag,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/planner/buckets/$bucketId',
        data: jsonEncode(request.toJson()),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return PlannerBucket.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to update bucket: $bucketId');
    }
  }

  /// Deletes a bucket.
  ///
  /// [bucketId] is the ID of the bucket to delete.
  /// [eTag] is the ETag (entity tag) of the bucket, used for concurrency control.
  ///
  /// Returns true if the deletion was successful.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<bool> deleteBucket(String bucketId, String eTag) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/planner/buckets/$bucketId',
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete bucket: $bucketId');
    }
  }

  // Task assignments

  /// Assigns a task to a user.
  ///
  /// [taskId] is the ID of the task.
  /// [userId] is the ID of the user to assign the task to.
  /// [eTag] is the ETag (entity tag) of the task, used for concurrency control.
  ///
  /// Returns true if the assignment was successful.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<bool> assignTask(String taskId, String userId, String eTag) async {
    try {
      final Map<String, dynamic> assignments = {
        'assignments': {
          userId: {
            '@odata.type': '#microsoft.graph.plannerAssignment',
            'orderHint': ' !',
          }
        }
      };

      await _dio.patch(
        '$_baseUrl/planner/tasks/$taskId',
        data: jsonEncode(assignments),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return true;
    } catch (e) {
      throw _handleError(e, 'Failed to assign task: $taskId to user: $userId');
    }
  }

  /// Removes a task assignment from a user.
  ///
  /// [taskId] is the ID of the task.
  /// [userId] is the ID of the user to remove the assignment from.
  /// [eTag] is the ETag (entity tag) of the task, used for concurrency control.
  ///
  /// Returns true if the assignment removal was successful.
  ///
  /// **Required permissions**: Group.ReadWrite.All
  Future<bool> unassignTask(String taskId, String userId, String eTag) async {
    try {
      final Map<String, dynamic> assignments = {
        'assignments': {
          userId: null,
        }
      };

      await _dio.patch(
        '$_baseUrl/planner/tasks/$taskId',
        data: jsonEncode(assignments),
        options: Options(headers: {
          ..._headers,
          'If-Match': eTag,
        }),
      );

      return true;
    } catch (e) {
      throw _handleError(e, 'Failed to unassign task: $taskId from user: $userId');
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
          final error = data['error'];
          if (error != null && error is Map<String, dynamic>) {
            errorMessage = error['message'] ?? '';
          }
        }
        
        return Exception('$message. Status: $statusCode. $errorMessage');
      }
      return Exception('$message. ${error.message}');
    }
    return Exception('$message. $error');
  }
}

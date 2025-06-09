import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/group/group_models.dart';

/// Class for interacting with the Groups API in Microsoft Graph.
class GroupAPI {
  final String _token;
  GroupAPI(this._token);

  final Dio _dio = Dio();

  /// Fetches all groups the authenticated user is a member of.
  ///
  /// This method sends a GET request to the Microsoft Graph API to retrieve all groups.
  /// It returns a list of [Group] objects representing the groups.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.Read.All, Group.ReadWrite.All                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.Read.All, Group.ReadWrite.All                      |
  Future<List<Group>> getGroups({int top = 25}) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groups',
        queryParameters: {
          '${'top'}': top,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> groupList = response.data['value'];
        return groupList.map((groupJson) => Group.fromJson(groupJson)).toList();
      } else {
        log('Failed to fetch groups: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching groups: $e');
      return [];
    }
  }

  /// Gets a specific group by its ID.
  ///
  /// [groupId] is the ID of the group to retrieve.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.Read.All, Group.ReadWrite.All                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.Read.All, Group.ReadWrite.All                      |
  Future<Group> getGroup(String groupId) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groups/$groupId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return Group.fromJson(response.data);
    } catch (e) {
      log('Error fetching group: $e');
      return const Group.empty();
    }
  }

  /// Creates a new group.
  ///
  /// [request] is a [GroupCreateRequest] containing the group properties.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.ReadWrite.All                                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.ReadWrite.All                                      |
  Future<Group> createGroup(GroupCreateRequest request) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/groups',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      return Group.fromJson(response.data);
    } catch (e) {
      log('Error creating group: $e');
      return const Group.empty();
    }
  }

  /// Updates a group's properties.
  ///
  /// [groupId] is the ID of the group to update.
  /// [properties] is a map containing the properties to update.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.ReadWrite.All                                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.ReadWrite.All                                      |
  Future<bool> updateGroup(String groupId, Map<String, dynamic> properties) async {
    try {
      final response = await _dio.patch(
        'https://graph.microsoft.com/v1.0/groups/$groupId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: properties,
      );

      return response.statusCode == 204;
    } catch (e) {
      log('Error updating group: $e');
      return false;
    }
  }

  /// Deletes a group.
  ///
  /// [groupId] is the ID of the group to delete.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.ReadWrite.All                                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.ReadWrite.All                                      |
  Future<bool> deleteGroup(String groupId) async {
    try {
      final response = await _dio.delete(
        'https://graph.microsoft.com/v1.0/groups/$groupId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return response.statusCode == 204;
    } catch (e) {
      log('Error deleting group: $e');
      return false;
    }
  }

  /// Gets members of a group.
  ///
  /// [groupId] is the ID of the group.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | GroupMember.Read.All, GroupMember.ReadWrite.All          |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | GroupMember.Read.All, GroupMember.ReadWrite.All          |
  Future<List<GroupMember>> getGroupMembers(String groupId) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groups/$groupId/members',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> memberList = response.data['value'];
        return memberList.map((memberJson) => GroupMember.fromJson(memberJson)).toList();
      } else {
        log('Failed to fetch group members: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching group members: $e');
      return [];
    }
  }

  /// Adds a member to a group.
  ///
  /// [groupId] is the ID of the group.
  /// [userId] is the ID of the user to add.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | GroupMember.ReadWrite.All                                |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | GroupMember.ReadWrite.All                                |
  Future<bool> addGroupMember(String groupId, String userId) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/groups/$groupId/members/\$ref',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          '@odata.id': 'https://graph.microsoft.com/v1.0/directoryObjects/$userId',
        },
      );

      return response.statusCode == 204;
    } catch (e) {
      log('Error adding group member: $e');
      return false;
    }
  }

  /// Removes a member from a group.
  ///
  /// [groupId] is the ID of the group.
  /// [userId] is the ID of the user to remove.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | GroupMember.ReadWrite.All                                |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | GroupMember.ReadWrite.All                                |
  Future<bool> removeGroupMember(String groupId, String userId) async {
    try {
      final response = await _dio.delete(
        'https://graph.microsoft.com/v1.0/groups/$groupId/members/$userId/\$ref',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return response.statusCode == 204;
    } catch (e) {
      log('Error removing group member: $e');
      return false;
    }
  }

  /// Gets conversations in a group.
  ///
  /// [groupId] is the ID of the group.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.Read.All, Group.ReadWrite.All                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.Read.All, Group.ReadWrite.All                      |
  Future<List<GroupConversation>> getGroupConversations(String groupId) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groups/$groupId/conversations',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> conversationList = response.data['value'];
        return conversationList.map((conversationJson) => GroupConversation.fromJson(conversationJson)).toList();
      } else {
        log('Failed to fetch group conversations: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching group conversations: $e');
      return [];
    }
  }

  /// Creates a new conversation in a group.
  ///
  /// [groupId] is the ID of the group.
  /// [request] is a [ConversationCreateRequest] containing the conversation properties.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.ReadWrite.All                                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.ReadWrite.All                                      |
  Future<GroupConversation> createGroupConversation(String groupId, ConversationCreateRequest request) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/groups/$groupId/conversations',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      return GroupConversation.fromJson(response.data);
    } catch (e) {
      log('Error creating group conversation: $e');
      return const GroupConversation.empty();
    }
  }

  /// Gets threads in a conversation.
  ///
  /// [groupId] is the ID of the group.
  /// [conversationId] is the ID of the conversation.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.Read.All, Group.ReadWrite.All                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.Read.All, Group.ReadWrite.All                      |
  Future<List<ConversationThread>> getConversationThreads(String groupId, String conversationId) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groups/$groupId/conversations/$conversationId/threads',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> threadList = response.data['value'];
        return threadList.map((threadJson) => ConversationThread.fromJson(threadJson)).toList();
      } else {
        log('Failed to fetch conversation threads: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching conversation threads: $e');
      return [];
    }
  }

  /// Gets posts in a thread.
  ///
  /// [groupId] is the ID of the group.
  /// [conversationId] is the ID of the conversation.
  /// [threadId] is the ID of the thread.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.Read.All, Group.ReadWrite.All                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.Read.All, Group.ReadWrite.All                      |
  Future<List<Post>> getThreadPosts(String groupId, String conversationId, String threadId) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groups/$groupId/conversations/$conversationId/threads/$threadId/posts',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> postList = response.data['value'];
        return postList.map((postJson) => Post.fromJson(postJson)).toList();
      } else {
        log('Failed to fetch thread posts: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching thread posts: $e');
      return [];
    }
  }

  /// Creates a post in a thread.
  ///
  /// [groupId] is the ID of the group.
  /// [conversationId] is the ID of the conversation.
  /// [threadId] is the ID of the thread.
  /// [request] is a [PostCreateRequest] containing the post properties.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Group.ReadWrite.All                                      |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Group.ReadWrite.All                                      |
  Future<Post> createPost(String groupId, String conversationId, String threadId, PostCreateRequest request) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/groups/$groupId/conversations/$conversationId/threads/$threadId/reply',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      return Post.fromJson(response.data);
    } catch (e) {
      log('Error creating post: $e');
      return const Post.empty();
    }
  }

  /// Gets lifecycle policies applicable to the tenant.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Directory.Read.All                                       |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Directory.Read.All                                       |
  Future<List<GroupLifecyclePolicy>> getGroupLifecyclePolicies() async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/groupLifecyclePolicies',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> policyList = response.data['value'];
        return policyList.map((policyJson) => GroupLifecyclePolicy.fromJson(policyJson)).toList();
      } else {
        log('Failed to fetch group lifecycle policies: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching group lifecycle policies: $e');
      return [];
    }
  }

  /// Adds a lifecycle policy to a group.
  ///
  /// [groupId] is the ID of the group.
  /// [policyId] is the ID of the lifecycle policy.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Directory.ReadWrite.All                                  |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Directory.ReadWrite.All                                  |
  Future<bool> addLifecyclePolicyToGroup(String groupId, String policyId) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/groupLifecyclePolicies/$policyId/addGroup',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'groupId': groupId,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      log('Error adding lifecycle policy to group: $e');
      return false;
    }
  }

  /// Removes a lifecycle policy from a group.
  ///
  /// [groupId] is the ID of the group.
  /// [policyId] is the ID of the lifecycle policy.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Directory.ReadWrite.All                                  |
  /// | Delegated (personal Microsoft account)     | Not supported.                                           |
  /// | Application                                | Directory.ReadWrite.All                                  |
  Future<bool> removeLifecyclePolicyFromGroup(String groupId, String policyId) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/groupLifecyclePolicies/$policyId/removeGroup',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'groupId': groupId,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      log('Error removing lifecycle policy from group: $e');
      return false;
    }
  }
}

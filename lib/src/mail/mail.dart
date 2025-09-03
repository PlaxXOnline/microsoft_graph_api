import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/mail/mail_models.dart';

/// Class for interacting with the Mail API in Microsoft Graph.
class Mail {
  final String _token;
  Mail(this._token);

  final Dio _dio = Dio();

  /// Fetches all mail folders in the user's mailbox.
  ///
  /// This method sends a GET request to the Microsoft Graph API to retrieve all mail folders.
  /// It returns a list of [MailFolder] objects representing the mail folders.
  ///
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Read, Mail.ReadWrite                                |
  /// | Delegated (personal Microsoft account)     | Mail.Read, Mail.ReadWrite                                |
  /// | Application                                | Mail.Read, Mail.ReadWrite                                |
  Future<List<MailFolder>> getMailFolders({String userIdOrPrincipal = ''}) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/mailFolders',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> folderList = response.data['value'];
        return folderList.map((folderJson) => MailFolder.fromJson(folderJson)).toList();
      } else {
        log('Failed to fetch mail folders: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching mail folders: $e');
      return [];
    }
  }

  /// Gets a specific mail folder by its ID.
  ///
  /// [folderId] is the ID of the mail folder to retrieve.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Read, Mail.ReadWrite                                |
  /// | Delegated (personal Microsoft account)     | Mail.Read, Mail.ReadWrite                                |
  /// | Application                                | Mail.Read, Mail.ReadWrite                                |
  Future<MailFolder> getMailFolder(String folderId, {String userIdOrPrincipal = ''}) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/mailFolders/$folderId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return MailFolder.fromJson(response.data);
    } catch (e) {
      log('Error fetching mail folder: $e');
      return const MailFolder.empty();
    }
  }

  /// Creates a new mail folder in the user's mailbox.
  ///
  /// [displayName] is the display name of the new folder.
  /// [parentFolderId] is the ID of the parent folder. If null, the folder is created at the root level.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<MailFolder> createMailFolder(
    String displayName, {
    String? parentFolderId,
    String userIdOrPrincipal = '',
  }) async {
    try {
      final Map<String, dynamic> data = {
        'displayName': displayName,
      };

      if (parentFolderId != null) {
        data['parentFolderId'] = parentFolderId;
      }

      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/mailFolders',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );

      return MailFolder.fromJson(response.data);
    } catch (e) {
      log('Error creating mail folder: $e');
      return const MailFolder.empty();
    }
  }

  /// Gets messages in the user's mailbox.
  ///
  /// [folderId] is the ID of the folder to get messages from. If null, messages are retrieved from the inbox.
  /// [filter] is an optional OData filter expression.
  /// [top] is the maximum number of messages to retrieve.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Read, Mail.ReadWrite                                |
  /// | Delegated (personal Microsoft account)     | Mail.Read, Mail.ReadWrite                                |
  /// | Application                                | Mail.Read, Mail.ReadWrite                                |
  Future<List<Message>> getMessages({
    String? folderId,
    String? filter,
    int top = 25,
    String userIdOrPrincipal = '',
  }) async {
    try {
      String url;
      if (folderId != null) {
        url =
            'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/mailFolders/$folderId/messages';
      } else {
        url = 'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages';
      }

      // Build query parameters
      Map<String, dynamic> queryParams = {'${'top'}': top};
      if (filter != null) {
        queryParams['${'filter'}'] = filter;
      }

      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> messageList = response.data['value'];
        return messageList.map((messageJson) => Message.fromJson(messageJson)).toList();
      } else {
        log('Failed to fetch messages: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching messages: $e');
      return [];
    }
  }

  /// Gets a specific message by its ID.
  ///
  /// [messageId] is the ID of the message to retrieve.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Read, Mail.ReadWrite                                |
  /// | Delegated (personal Microsoft account)     | Mail.Read, Mail.ReadWrite                                |
  /// | Application                                | Mail.Read, Mail.ReadWrite                                |
  Future<Message> getMessage(
    String messageId, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return Message.fromJson(response.data);
    } catch (e) {
      log('Error fetching message: $e');
      return const Message.empty();
    }
  }

  /// Creates a draft message.
  ///
  /// [request] is a [MessageCreateRequest] containing the message properties.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<Message> createDraft(
    MessageCreateRequest request, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      return Message.fromJson(response.data);
    } catch (e) {
      log('Error creating draft message: $e');
      return const Message.empty();
    }
  }

  /// Sends a new message.
  ///
  /// [request] is a [MessageCreateRequest] containing the message properties.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Send                                                |
  /// | Delegated (personal Microsoft account)     | Mail.Send                                                |
  /// | Application                                | Mail.Send                                                |
  Future<bool> sendMail(
    MessageCreateRequest request, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      final data = {
        'message': request.toJson(),
        'saveToSentItems': request.saveToSentItems ?? true,
      };

      await _dio.post(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/sendMail',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );

      return true;
    } catch (e) {
      log('Error sending message: $e');
      return false;
    }
  }

  /// Sends an existing draft message.
  ///
  /// [messageId] is the ID of the draft message to send.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Send                                                |
  /// | Delegated (personal Microsoft account)     | Mail.Send                                                |
  /// | Application                                | Mail.Send                                                |
  Future<bool> sendDraft(
    String messageId, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      await _dio.post(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId/send',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return true;
    } catch (e) {
      log('Error sending draft message: $e');
      return false;
    }
  }

  /// Updates a message's properties.
  ///
  /// [messageId] is the ID of the message to update.
  /// [properties] is a map containing the properties to update.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<bool> updateMessage(
    String messageId,
    Map<String, dynamic> properties, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      await _dio.patch(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: properties,
      );

      return true;
    } catch (e) {
      log('Error updating message: $e');
      return false;
    }
  }

  /// Marks a message as read or unread.
  ///
  /// [messageId] is the ID of the message to update.
  /// [isRead] is true to mark the message as read, false to mark it as unread.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<bool> markAsRead(
    String messageId,
    bool isRead, {
    String userIdOrPrincipal = '',
  }) async {
    return updateMessage(messageId, {'isRead': isRead}, userIdOrPrincipal: userIdOrPrincipal);
  }

  /// Moves a message to a different folder.
  ///
  /// [messageId] is the ID of the message to move.
  /// [destinationFolderId] is the ID of the destination folder.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<Message> moveMessage(
    String messageId,
    String destinationFolderId, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId/move',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'destinationId': destinationFolderId,
        },
      );

      return Message.fromJson(response.data);
    } catch (e) {
      log('Error moving message: $e');
      return const Message.empty();
    }
  }

  /// Deletes a message.
  ///
  /// [messageId] is the ID of the message to delete.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<bool> deleteMessage(
    String messageId, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      await _dio.delete(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      return true;
    } catch (e) {
      log('Error deleting message: $e');
      return false;
    }
  }

  /// Gets the attachments of a message.
  ///
  /// [messageId] is the ID of the message.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Read, Mail.ReadWrite                                |
  /// | Delegated (personal Microsoft account)     | Mail.Read, Mail.ReadWrite                                |
  /// | Application                                | Mail.Read, Mail.ReadWrite                                |
  Future<List<Attachment>> getAttachments(
    String messageId, {
    String userIdOrPrincipal = '',
  }) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId/attachments',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> attachmentList = response.data['value'];
        return attachmentList.map((attachmentJson) => Attachment.fromJson(attachmentJson)).toList();
      } else {
        log('Failed to fetch attachments: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error fetching attachments: $e');
      return [];
    }
  }

  /// Adds an attachment to a message.
  ///
  /// [messageId] is the ID of the message.
  /// [name] is the name of the attachment.
  /// [contentBytes] is the base64-encoded content of the attachment.
  /// [contentType] is the MIME type of the attachment.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<Attachment> addAttachment(
    String messageId,
    String name,
    String contentBytes,
    String contentType, {
    bool isInline = false,
    String? contentId,
    String userIdOrPrincipal = '',
  }) async {
    try {
      final Map<String, dynamic> data = {
        '@odata.type': '#microsoft.graph.fileAttachment',
        'name': name,
        'contentBytes': contentBytes,
        'contentType': contentType,
        'isInline': isInline,
      };

      if (contentId != null) {
        data['contentId'] = contentId;
      }

      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages/$messageId/attachments',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );

      return Attachment.fromJson(response.data);
    } catch (e) {
      log('Error adding attachment: $e');
      return const Attachment.empty();
    }
  }

  /// Sets a flag on a message.
  ///
  /// [messageId] is the ID of the message.
  /// [flagStatus] is the flag status: 'notFlagged', 'flagged', or 'complete'.
  /// [startDateTime] is the start date for the follow-up.
  /// [dueDateTime] is the due date for the follow-up.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.ReadWrite                                           |
  /// | Delegated (personal Microsoft account)     | Mail.ReadWrite                                           |
  /// | Application                                | Mail.ReadWrite                                           |
  Future<bool> setFlag(
    String messageId,
    String flagStatus, {
    DateTime? startDateTime,
    DateTime? dueDateTime,
    String userIdOrPrincipal = '',
  }) async {
    try {
      final Map<String, dynamic> flag = {
        'flagStatus': flagStatus,
      };

      if (startDateTime != null) {
        flag['startDateTime'] = {
          'dateTime': startDateTime.toIso8601String(),
          'timeZone': 'UTC',
        };
      }

      if (dueDateTime != null) {
        flag['dueDateTime'] = {
          'dateTime': dueDateTime.toIso8601String(),
          'timeZone': 'UTC',
        };
      }

      return updateMessage(messageId, {'flag': flag, userIdOrPrincipal: userIdOrPrincipal});
    } catch (e) {
      log('Error setting flag: $e');
      return false;
    }
  }

  /// Searches for messages that match the provided query.
  ///
  /// [query] is the search query.
  /// [folderId] is the ID of the folder to search in. If null, all folders are searched.
  /// [userIdOrPrincipal] optional username or ID to fetch mailboxes for. Defaults to current user if not specified.
  ///
  /// | Permission type                             | Permissions (from least to most privileged)              |
  /// |--------------------------------------------|----------------------------------------------------------|
  /// | Delegated (work or school account)         | Mail.Read, Mail.ReadWrite                                |
  /// | Delegated (personal Microsoft account)     | Mail.Read, Mail.ReadWrite                                |
  /// | Application                                | Mail.Read, Mail.ReadWrite                                |
  Future<List<Message>> searchMessages(
    String query, {
    String? folderId,
    int top = 25,
    String userIdOrPrincipal = '',
  }) async {
    try {
      String url;
      if (folderId != null) {
        url =
            'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/mailFolders/$folderId/messages';
      } else {
        url = 'https://graph.microsoft.com/v1.0/${_meOrPrincipalUser(userIdOrPrincipal)}/messages';
      }

      final response = await _dio.get(
        url,
        queryParameters: {
          '${'search'}': '"$query"',
          '${'top'}': top,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'ConsistencyLevel': 'eventual',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> messageList = response.data['value'];
        return messageList.map((messageJson) => Message.fromJson(messageJson)).toList();
      } else {
        log('Failed to search messages: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Error searching messages: $e');
      return [];
    }
  }

  String _meOrPrincipalUser(String userIdOrPrincipal) => userIdOrPrincipal.isEmpty ? 'me' : 'users/$userIdOrPrincipal';
}

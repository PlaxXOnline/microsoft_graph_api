import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/drive/drive_models.dart';

/// Provides access to operations on OneDrive files and folders through Microsoft Graph API.
class DriveAPI {
  final String _token;
  final Dio _dio;
  static const String _baseUrl = 'https://graph.microsoft.com/v1.0';

  /// Creates a new instance of the DriveAPI class.
  /// Requires a valid Microsoft Graph API authentication token.
  DriveAPI(this._token) : _dio = Dio();

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      };

  /// Lists the drives available to the authenticated user.
  ///
  /// Returns a list of [Drive] objects.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All, Sites.Read.All
  Future<List<Drive>> getDrives() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/drives',
        options: Options(headers: _headers),
      );

      final List<dynamic> drivesJson = response.data['value'];
      return drivesJson.map((json) => Drive.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get drives');
    }
  }

  /// Gets information about the default drive of the authenticated user.
  ///
  /// Returns a [Drive] object containing details about the drive.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<Drive> getDefaultDrive() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/me/drive',
        options: Options(headers: _headers),
      );

      return Drive.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get default drive');
    }
  }

  /// Gets information about a specific drive by ID.
  ///
  /// [driveId] is the unique identifier of the drive.
  ///
  /// Returns a [Drive] object containing details about the drive.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All, Sites.Read.All
  Future<Drive> getDrive(String driveId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/drives/$driveId',
        options: Options(headers: _headers),
      );

      return Drive.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get drive: $driveId');
    }
  }

  /// Lists the root folder items of the default drive.
  ///
  /// [folderId] is the unique identifier of the folder. Use 'root' for the root folder.
  /// [driveId] is optional. If not provided, the default drive is used.
  /// [queryParams] optional query parameters like filter, expand, orderby, etc.
  ///
  /// Returns a list of [DriveItem] objects.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<List<DriveItem>> listItems({
    String folderId = 'root',
    String? driveId,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$folderId/children';
      } else {
        url = '$_baseUrl/me/drive/items/$folderId/children';
      }

      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: _headers),
      );

      final List<dynamic> itemsJson = response.data['value'];
      return itemsJson.map((json) => DriveItem.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to list items in folder: $folderId');
    }
  }

  /// Gets a specific item (file or folder) by ID.
  ///
  /// [itemId] is the unique identifier of the item.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns a [DriveItem] object.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<DriveItem> getItem(String itemId, {String? driveId}) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$itemId';
      } else {
        url = '$_baseUrl/me/drive/items/$itemId';
      }

      final response = await _dio.get(
        url,
        options: Options(headers: _headers),
      );

      return DriveItem.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get item: $itemId');
    }
  }

  /// Gets an item by path rather than ID.
  ///
  /// [path] is the path to the item, e.g., '/Documents/Report.docx'.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns a [DriveItem] object.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<DriveItem> getItemByPath(String path, {String? driveId}) async {
    try {
      String url;
      String encodedPath = Uri.encodeComponent(path);
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/root:$encodedPath';
      } else {
        url = '$_baseUrl/me/drive/root:$encodedPath';
      }

      final response = await _dio.get(
        url,
        options: Options(headers: _headers),
      );

      return DriveItem.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get item at path: $path');
    }
  }

  /// Downloads the content of a file.
  ///
  /// [itemId] is the unique identifier of the file.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns the file content as [Uint8List].
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<Uint8List> downloadFile(String itemId, {String? driveId}) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$itemId/content';
      } else {
        url = '$_baseUrl/me/drive/items/$itemId/content';
      }

      final response = await _dio.get(
        url,
        options: Options(
          headers: _headers,
          responseType: ResponseType.bytes,
        ),
      );

      return Uint8List.fromList(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to download file: $itemId');
    }
  }

  /// Creates a new folder.
  ///
  /// [folderName] is the name for the new folder.
  /// [parentFolderId] is the ID of the parent folder. Use 'root' for the root folder.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns a [DriveItem] object representing the new folder.
  ///
  /// **Required permissions**: Files.ReadWrite, Files.ReadWrite.All
  Future<DriveItem> createFolder(
    String folderName, {
    String parentFolderId = 'root',
    String? driveId,
  }) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$parentFolderId/children';
      } else {
        url = '$_baseUrl/me/drive/items/$parentFolderId/children';
      }

      final response = await _dio.post(
        url,
        data: jsonEncode({
          'name': folderName,
          'folder': {},
          '@microsoft.graph.conflictBehavior': 'rename',
        }),
        options: Options(headers: _headers),
      );

      return DriveItem.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to create folder: $folderName');
    }
  }

  /// Uploads a small file (less than 4MB).
  ///
  /// [fileName] is the name for the new file.
  /// [content] is the content of the file.
  /// [parentFolderId] is the ID of the parent folder. Use 'root' for the root folder.
  /// [driveId] is optional. If not provided, the default drive is used.
  /// [contentType] is the MIME type of the file.
  ///
  /// Returns a [DriveItem] object representing the new file.
  ///
  /// **Required permissions**: Files.ReadWrite, Files.ReadWrite.All
  Future<DriveItem> uploadSmallFile(
    String fileName,
    Uint8List content, {
    String parentFolderId = 'root',
    String? driveId,
    String contentType = 'application/octet-stream',
  }) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$parentFolderId:/$fileName:/content';
      } else {
        url = '$_baseUrl/me/drive/items/$parentFolderId:/$fileName:/content';
      }

      final response = await _dio.put(
        url,
        data: Stream.fromIterable([content]),
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': contentType,
          },
          contentType: contentType,
        ),
      );

      return DriveItem.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to upload file: $fileName');
    }
  }

  /// Creates an upload session for large file uploads (larger than 4MB).
  ///
  /// [fileName] is the name for the new file.
  /// [parentFolderId] is the ID of the parent folder. Use 'root' for the root folder.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns an [UploadSession] object containing the upload URL and expiration date.
  ///
  /// **Required permissions**: Files.ReadWrite, Files.ReadWrite.All
  Future<UploadSession> createUploadSession(
    String fileName, {
    String parentFolderId = 'root',
    String? driveId,
  }) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$parentFolderId:/$fileName:/createUploadSession';
      } else {
        url = '$_baseUrl/me/drive/items/$parentFolderId:/$fileName:/createUploadSession';
      }

      final response = await _dio.post(
        url,
        data: jsonEncode({
          'item': {
            '@microsoft.graph.conflictBehavior': 'rename',
            'name': fileName,
          },
        }),
        options: Options(headers: _headers),
      );

      return UploadSession.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to create upload session for file: $fileName');
    }
  }

  /// Deletes a file or folder.
  ///
  /// [itemId] is the ID of the item to delete.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns true if the delete operation was successful.
  ///
  /// **Required permissions**: Files.ReadWrite, Files.ReadWrite.All
  Future<bool> deleteItem(String itemId, {String? driveId}) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$itemId';
      } else {
        url = '$_baseUrl/me/drive/items/$itemId';
      }

      final response = await _dio.delete(
        url,
        options: Options(headers: _headers),
      );

      return response.statusCode == 204;
    } catch (e) {
      throw _handleError(e, 'Failed to delete item: $itemId');
    }
  }

  /// Moves a file or folder to a new location.
  ///
  /// [itemId] is the ID of the item to move.
  /// [newParentId] is the ID of the new parent folder.
  /// [newName] is optional. If provided, the item will be renamed.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns the updated [DriveItem].
  ///
  /// **Required permissions**: Files.ReadWrite, Files.ReadWrite.All
  Future<DriveItem> moveItem(
    String itemId,
    String newParentId, {
    String? newName,
    String? driveId,
  }) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$itemId';
      } else {
        url = '$_baseUrl/me/drive/items/$itemId';
      }

      Map<String, dynamic> data = {
        'parentReference': {'id': newParentId},
      };

      if (newName != null) {
        data['name'] = newName;
      }

      final response = await _dio.patch(
        url,
        data: jsonEncode(data),
        options: Options(headers: _headers),
      );

      return DriveItem.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to move item: $itemId');
    }
  }

  /// Copies a file or folder to a new location.
  ///
  /// [itemId] is the ID of the item to copy.
  /// [newParentId] is the ID of the target parent folder.
  /// [newName] is optional. If provided, the copied item will use this name.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns true if the copy operation was initiated successfully.
  ///
  /// **Required permissions**: Files.ReadWrite, Files.ReadWrite.All
  Future<bool> copyItem(
    String itemId,
    String newParentId, {
    String? newName,
    String? driveId,
  }) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$itemId/copy';
      } else {
        url = '$_baseUrl/me/drive/items/$itemId/copy';
      }

      Map<String, dynamic> data = {
        'parentReference': {'driveId': driveId ?? 'me', 'id': newParentId},
      };

      if (newName != null) {
        data['name'] = newName;
      }

      final response = await _dio.post(
        url,
        data: jsonEncode(data),
        options: Options(headers: _headers),
      );

      // Microsoft Graph returns a 202 Accepted for copy operations
      return response.statusCode == 202;
    } catch (e) {
      throw _handleError(e, 'Failed to copy item: $itemId');
    }
  }

  /// Gets thumbnails for a file.
  ///
  /// [itemId] is the ID of the file.
  /// [driveId] is optional. If not provided, the default drive is used.
  ///
  /// Returns a [ThumbnailSet] containing small, medium, and large thumbnails if available.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<ThumbnailSet> getThumbnails(String itemId, {String? driveId}) async {
    try {
      String url;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/items/$itemId/thumbnails/0';
      } else {
        url = '$_baseUrl/me/drive/items/$itemId/thumbnails/0';
      }

      final response = await _dio.get(
        url,
        options: Options(headers: _headers),
      );

      return ThumbnailSet.fromJson(response.data);
    } catch (e) {
      throw _handleError(e, 'Failed to get thumbnails for item: $itemId');
    }
  }

  /// Searches for items in the drive.
  ///
  /// [query] is the search query string.
  /// [driveId] is optional. If not provided, the default drive is used.
  /// [queryParams] optional query parameters like filter, orderby, etc.
  ///
  /// Returns a list of [DriveItem] objects that match the search.
  ///
  /// **Required permissions**: Files.Read, Files.Read.All
  Future<List<DriveItem>> searchItems(
    String query, {
    String? driveId,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      String url;
      Map<String, dynamic> params = queryParams ?? {};
      params['q'] = query;
      
      if (driveId != null) {
        url = '$_baseUrl/drives/$driveId/root/search';
      } else {
        url = '$_baseUrl/me/drive/root/search';
      }

      final response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(headers: _headers),
      );

      final List<dynamic> itemsJson = response.data['value'];
      return itemsJson.map((json) => DriveItem.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e, 'Failed to search for items with query: $query');
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

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/models.dart';

class Contacts {
  final String _token;
  Contacts(this._token);

  final Dio _dio = Dio();

  /*-----------------------------Contact--------------------------------*/

  /// Fetches the all contact collection from the default contacts folder of the signed-in user.
  ///
  /// Takes an optional parameter to specify the folderId instead of the default contacts folder.
  ///
  /// See the [docs](https://learn.microsoft.com/en-us/graph/api/user-list-contacts?view=graph-rest-1.0&tabs=http)
  /// for more information on how to use the query param
  Future<List<Contact>> listContacts({
    final String? folderId,
    final Map<String, dynamic>? query,
  }) async {
    final uri = Uri.https(
      'graph.microsoft.com',
      folderId == null
          ? '/v1.0/me/contacts'
          : '/v1.0/me/contactFolders/$folderId/contacts',
      query,
    );

    try {
      final response = await _dio.get(
        uri.toString(),
        options: Options(
          headers: {'Authorization': 'Bearer $_token'},
          contentType: 'application/json',
        ),
      );

      // Convert the response data to Contact objects
      final contacts = (response.data['value'] as List<dynamic>)
          .map((item) => Contact.fromJson(item))
          .toList();

      log('contacts: $contacts');

      return contacts;
    } catch (e) {
      log('Failed to fetch contacts: $e');

      rethrow;
    }
  }

  /// Does not include the default folder
  Future<List<ContactFolder>> listContactFolders() async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/me/contactFolders',
        options: Options(
          headers: {'Authorization': 'Bearer $_token'},
          contentType: 'application/json',
        ),
      );

      // Convert the response data to Contact objects
      final contactsFolders = (response.data['value'] as List<dynamic>)
          .map((item) => ContactFolder.fromJson(item))
          .toList();

      log('contactFolders: $contactsFolders');

      return contactsFolders;
    } catch (e) {
      log('Failed to fetch contact folders: $e');
      rethrow;
    }
  }
}

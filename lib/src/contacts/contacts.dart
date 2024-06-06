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
  /// Iterating over pages of results is handled internally.
  ///
  /// You can specify the page size via the r'$top' query param. Microsoft's default page size is 10.
  ///
  /// To learn more about supported query params see [here](https://learn.microsoft.com/en-us/graph/query-parameters?tabs=http)
  ///
  /// [Endpoint Documentation](https://learn.microsoft.com/en-us/graph/api/user-list-contacts?view=graph-rest-1.0&tabs=http)
  Future<List<Contact>> listContacts({
    final String? folderId,
    final Map<String, dynamic>? query,
    final int maxPages = 100,
  }) async {
    var hasMorePages = true;
    final allContacts = <Contact>[];
    var queryParams = query;
    var page = 0;
    while (hasMorePages) {
      if (maxPages <= page) {
        log('Max pages reached!!');
        break;
      }

      final response = await _fetch(folderId: folderId, query: queryParams);

      final contacts = _parseContacts(response);
      allContacts.addAll(contacts);

      final nextLink = response.data['@odata.nextLink'] as String?;
      if (nextLink == null) {
        hasMorePages = false;
      } else {
        queryParams = {
          ...?query,
          ...?Uri.tryParse(nextLink)?.queryParameters,
        };
      }

      page++;
    }

    return allContacts;
  }

  Future<Response<dynamic>> _fetch({
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

      return response;
    } catch (e) {
      log('Failed to fetch contacts: $e');

      rethrow;
    }
  }

  _parseContacts(Response<dynamic> response) {
    // Convert the response data to Contact objects
    final contacts = (response.data['value'] as List<dynamic>)
        .map((item) => Contact.fromJson(item))
        .toList();

    log('contacts: $contacts');

    return contacts;
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

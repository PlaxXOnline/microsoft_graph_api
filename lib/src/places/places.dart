import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/models.dart';

class Places {
  final String _token;
  Places(this._token);

  final Dio _dio = Dio();

  /*-----------------------------Places/Rooms--------------------------------*/

  /// Fetches all the rooms from the Microsoft Graph API.
  ///
  /// The method performs a GET request for the rooms.
  /// The request requires an authorization header with the bearer token.
  ///
  /// If the request is successful, the method logs the rooms.
  /// If there's an error during the request, the method logs an error message.
  ///
  /// Returns a Future that completes with a List of Room objects.
  ///
  /// | Permission type                             | Permissions     |
  /// |--------------------------------------------|-----------------|
  /// | Delegated (work or school account)         | Place.Read.All  |
  /// | Delegated (personal Microsoft account)     | Not supported   |
  /// | Application                                | Place.Read.All  |
  Future<List<Room>> fetchAllRooms() async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/places/microsoft.graph.room',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
          contentType: 'application/json',
        ),
      );

      // Convert the response data to Room objects
      final rooms = (response.data['value'] as List)
          .map((item) => Room.fromJson(item))
          .toList();

      log('Rooms: $rooms');

      return rooms;
    } catch (e) {
      log('Failed to fetch rooms: $e');
      rethrow;
    }
  }

  /// Fetches all the room lists from the Microsoft Graph API.
  ///
  /// The method performs a GET request for the room lists.
  /// The request requires an authorization header with the bearer token.
  ///
  /// If the request is successful, the method logs the room lists.
  /// If there's an error during the request, the method logs an error message.
  ///
  /// Returns a Future that completes with a List of RoomList objects.
  ///
  /// | Permission type                             | Permissions     |
  /// |--------------------------------------------|-----------------|
  /// | Delegated (work or school account)         | Place.Read.All  |
  /// | Delegated (personal Microsoft account)     | Not supported   |
  /// | Application                                | Place.Read.All  |
  Future<List<RoomList>> fetchAllRoomLists() async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/places/microsoft.graph.roomlist',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
          contentType: 'application/json',
        ),
      );

      // Convert the response data to RoomList objects
      final roomLists = (response.data['value'] as List)
          .map((item) => RoomList.fromJson(item))
          .toList();

      log('Room Lists: $roomLists');

      return roomLists;
    } catch (e) {
      log('Failed to fetch room lists: $e');
      rethrow;
    }
  }
}

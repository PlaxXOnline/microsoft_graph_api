import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/calendar/calendar_models.dart';

// ignore_for_file: unused_local_variable

class MeetingRooms {
  final String _token;
  MeetingRooms(this._token);

  final Dio _dio = Dio();

  /*-----------------------------Meeting-Rooms--------------------------------*/

  /// Books a meeting room by creating a new event using the Microsoft Graph API.
  ///
  /// This function is asynchronous and doesn't return any value (`void`). It takes two parameters:
  /// `_token`: the access token used to authenticate the request.
  /// `event`: a map representing the event to be created. This event should represent the booking of the meeting room, and the map should contain keys and values that adhere to the Microsoft Graph API's event structure.
  ///
  /// The function sends a POST request to the Microsoft Graph API. The request's body (`data`) is the `event` parameter, which represents the new event to be created (i.e., the booking of the meeting room).
  ///
  /// If the request is successful, the function logs a success message. This does not necessarily mean that the meeting room was booked as expected, only that the server responded without error. To confirm that the meeting room was booked as expected, you might want to fetch the event again and check its properties.
  ///
  /// In case of an error (e.g., network error, invalid request data, etc.), the function catches the exception and logs an appropriate error message.
  ///
  /// | Permission type                             | Permissions           |
  /// |--------------------------------------------|-----------------------|
  /// | Delegated (work or school account)         | Calendars.ReadWrite   |
  /// | Delegated (personal Microsoft account)     | Calendars.ReadWrite   |
  /// | Application                                | Calendars.ReadWrite   |
  Future<void> bookMeetingRoom(CalendarEvent event) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/me/events',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json'
          },
        ),
        data: event,
      );

      log('Successfully booked meeting room');
    } catch (e) {
      log('Failed to book meeting room: $e');
    }
  }
}

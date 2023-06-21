import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/models.dart';

// ignore_for_file: unused_local_variable

class Calendar {
  final String _token;
  Calendar(this._token);

  final Dio _dio = Dio();

  /*-----------------------------Calendar--------------------------------*/

  /// Fetches calendar events from the Microsoft Graph API within a specific date range.
  ///
  /// This function is asynchronous and returns a list of `CalendarEvent` objects. It takes in two parameters:
  /// 1. `startDateTime`: the start date-time in ISO format to define the range of calendar events to fetch.
  /// 2. `endDateTime`: the end date-time in ISO format to define the range of calendar events to fetch.
  ///
  /// The function sends a GET request to the Microsoft Graph API. The requested URL includes the startDateTime and endDateTime parameters to filter the fetched events.
  ///
  /// If the request is successful, the function transforms the 'value' field from the response data into a list of `CalendarEvent` objects, which contains the calendar events, and returns this list.
  ///
  /// In case of an error (e.g., network error, invalid response data, etc.), the function catches the exception, logs an appropriate error message, and rethrows the exception.
  ///
  /// Returns a `Future` that completes with a list of `CalendarEvent` objects if the request was successful, or throws an exception if the request failed.
  Future<List<CalendarEvent>> fetchCalendarEventsForRange(
      DateTime startDateTime, DateTime endDateTime) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/me/calendar/calendarView?startDateTime=${startDateTime.toIso8601String()}&endDateTime=${endDateTime.toIso8601String()}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      final List<CalendarEvent> calendarEvents =
          (response.data["value"] as List)
              .map((event) => CalendarEvent.fromJson(event))
              .toList();

      return calendarEvents;
    } catch (e) {
      log('Failed to fetch calendar events: $e');
      rethrow;
    }
  }

  /// Creates a new calendar event using the Microsoft Graph API.
  ///
  /// This function is asynchronous and doesn't return any value (`void`). It takes two parameters:
  /// 1. `accessToken`: the access token used to authenticate the request.
  /// 2. `event`: a map representing the event to be created. The map should contain keys and values that adhere to the Microsoft Graph API's event structure.
  ///
  /// The function sends a POST request to the Microsoft Graph API. The request's body (`data`) is the `event` parameter, which represents the new event to be created.
  ///
  /// If the request is successful, the function logs a success message. This does not necessarily mean that the event was created as expected, only that the server responded without error. To confirm that the event was created as expected, you might want to fetch the event again and check its properties.
  ///
  /// In case of an error (e.g., network error, invalid request data, etc.), the function catches the exception and logs an appropriate error message.
  Future<void> createCalendarEvent(Map<String, dynamic> event) async {
    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/me/calendar/events',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json'
          },
        ),
        data: event,
      );

      log('Successfully created calendar event');
    } catch (e) {
      log('Failed to create calendar event: $e');
    }
  }
}

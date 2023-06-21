import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:microsoft_graph_api/models/models.dart';

// ignore_for_file: unused_local_variable

class Calendars {
  final String _token;
  Calendars(this._token);

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
  /// This function is asynchronous and returns a `CalendarEvent`. It takes one parameter:
  /// `event`: a `CalendarEvent` representing the event to be created.
  ///
  /// The function sends a POST request to the Microsoft Graph API. The request's body (`data`) is the `event` parameter, which represents the new event to be created.
  ///
  /// If the request is successful, the function logs a success message and returns the created event as a `CalendarEvent`.
  ///
  /// In case of an error (e.g., network error, invalid request data, etc.), the function catches the exception, logs an appropriate error message, and rethrow the exception.
  Future<CalendarEvent> createCalendarEvent({
    String? id,
    String? createdDateTime,
    String? lastModifiedDateTime,
    bool? isReminderOn,
    String? subject,
    String? bodyPreview,
    bool? isAllDay,
    bool? isOrganizer,
    String? startDateTime,
    String? endDateTime,
    List<Attendee>? attendees,
    Organizer? organizer,
  }) async {
    try {
      final eventMap = {
        if (id != null) 'id': id,
        if (createdDateTime != null) 'createdDateTime': createdDateTime,
        if (lastModifiedDateTime != null)
          'lastModifiedDateTime': lastModifiedDateTime,
        if (isReminderOn != null) 'isReminderOn': isReminderOn,
        if (subject != null) 'subject': subject,
        if (bodyPreview != null) 'bodyPreview': bodyPreview,
        if (isAllDay != null) 'isAllDay': isAllDay,
        if (isOrganizer != null) 'isOrganizer': isOrganizer,
        if (startDateTime != null) 'startDateTime': startDateTime,
        if (endDateTime != null) 'endDateTime': endDateTime,
        if (attendees != null)
          'attendees': attendees.map((attendee) => attendee.toJson()).toList(),
        if (organizer != null) 'organizer': organizer.toJson(),
      };

      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0/me/calendar/events',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json'
          },
        ),
        data: eventMap,
      );

      log('Successfully created calendar event');
      return CalendarEvent.fromJson(response.data);
    } catch (e) {
      log('Failed to create calendar event: $e');
      rethrow;
    }
  }

  /// Fetches calendar objects from the Microsoft Graph API.
  ///
  /// This function is asynchronous and returns a list of `Calendar` objects. It takes in one optional parameter:
  /// 1. `userId`: the user ID to fetch the calendars from. If null, the calendars of the current user will be fetched.
  ///
  /// The function sends a GET request to the Microsoft Graph API. The requested URL is based on whether a `userId` is provided.
  ///
  /// If the request is successful, the function transforms the 'value' field from the response data into a list of `Calendar` objects, which contains the calendars, and returns this list.
  ///
  /// In case of an error (e.g., network error, invalid response data, etc.), the function catches the exception, prints an appropriate error message, and rethrows the exception.
  ///
  /// Returns a `Future` that completes with a list of `Calendar` objects if the request was successful, or throws an exception if the request failed.
  Future<List<Calendar>> fetchCalendars({String? userId}) async {
    try {
      final String urlUserId = userId != null ? "/users/$userId" : "/me";

      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0$urlUserId/calendars',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      final List<Calendar> calendars = (response.data["value"] as List<dynamic>)
          .map<Calendar>((event) => Calendar.fromJson(event))
          .toList();

      return calendars;
    } catch (e) {
      log('Failed to fetch calendars: $e');
      rethrow;
    }
  }

  /// Fetches meeting time suggestions from Microsoft Graph API.
  ///
  /// This function is asynchronous and returns a [MeetingTimeSuggestionsResult] object. It takes several optional parameters:
  /// 1. `userId`: The user id for whom the meeting times should be fetched. If no user id is provided, the 'me' endpoint is used.
  /// 2. `attendees`: A list of [Attendee] objects representing the attendees of the meeting.
  /// 3. `timeSlots`: A list of [TimeSlot] objects representing the timeslots during which the meeting should occur.
  /// 4. `locationConstraint`: A [LocationConstraint] object representing the location constraints of the meeting.
  /// 5. `meetingDuration`: A string representing the duration of the meeting.
  ///
  /// The function sends a POST request to the Microsoft Graph API. The request's body is a map built from the parameters provided.
  ///
  /// If the request is successful, the function returns a [MeetingTimeSuggestionsResult] object created from the response data.
  ///
  /// If an error occurs during the request (e.g., network error, invalid request data, etc.), the function prints an error message and rethrows the exception.
  Future<MeetingTimeSuggestionsResult> findMeetingTimes({
    String? userId,
    List<Attendee>? attendees,
    List<TimeSlot>? timeSlots,
    LocationConstraint? locationConstraint,
    String? meetingDuration,
  }) async {
    final String urlUserId = userId != null ? "/users/$userId" : "/me";

    final Map<String, dynamic> body = {
      if (attendees != null)
        "attendees": attendees.map((a) => a.toJson()).toList(),
      if (timeSlots != null)
        "timeConstraint": {
          "timeslots": timeSlots.map((ts) => ts.toJson()).toList(),
        },
      if (locationConstraint != null)
        "locationConstraint": locationConstraint.toJson(),
      if (meetingDuration != null) "meetingDuration": meetingDuration,
    };

    try {
      final response = await _dio.post(
        'https://graph.microsoft.com/v1.0$urlUserId/findMeetingTimes',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
        data: jsonEncode(body),
      );

      return MeetingTimeSuggestionsResult.fromJson(response.data);
    } catch (e) {
      log('Failed to fetch meeting times: $e');
      rethrow;
    }
  }
}

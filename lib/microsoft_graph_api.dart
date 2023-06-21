library microsoft_graph_api;

import 'package:microsoft_graph_api/src/calendar/calendar.dart';
import 'package:microsoft_graph_api/src/me/me.dart';
import 'package:microsoft_graph_api/src/meetingrooms/meetingrooms.dart';
import 'package:microsoft_graph_api/src/place/place.dart';
import 'package:microsoft_graph_api/src/users/users.dart';

/// Class for interacting with the Microsoft Graph API.
/// This class serves as the central access point to the various
/// areas of the Microsoft Graph API, including users, calendar,
/// meeting rooms, and places.
class MSGraphAPI {
  final String _token;

  /// Represents the authenticated user.
  late Me me;

  /// Provides access to operations on users in the Microsoft Graph API.
  late Users users;

  /// Provides access to operations on the authenticated user's calendar.
  late Calendar calendar;

  /// Provides access to operations on meeting rooms.
  late MeetingRooms meetingRooms;

  /// Provides access to operations on places.
  late Place place;

  /// Creates a new instance of the MSGraphAPI class.
  /// Accepts an authentication token and initializes access to the various
  /// areas of the Microsoft Graph API.
  MSGraphAPI(this._token) {
    me = Me(_token);
    users = Users(_token);
    calendar = Calendar(_token);
    meetingRooms = MeetingRooms(_token);
    place = Place(_token);
  }
}

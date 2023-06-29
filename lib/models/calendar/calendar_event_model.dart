import '../models.dart';

/// Represents a calendar event.
///
/// Each instance holds various details about the event, such as its ID, creation time,
/// last modification time, reminder status, subject, preview of the body, all-day status,
/// organizer status, start time, end time, list of attendees, and the organizer.
class CalendarEvent {
  /// The ID of the event.
  ///
  /// Can be `null` if the ID is unknown or not provided.
  final String? id;

  /// The creation time of the event.
  ///
  /// Can be `null` if the creation time is unknown or not provided.
  final String? createdDateTime;

  /// The last modification time of the event.
  ///
  /// Can be `null` if the last modification time is unknown or not provided.
  final String? lastModifiedDateTime;

  /// The reminder status of the event.
  ///
  /// Can be `null` if the reminder status is unknown or not provided.
  final bool? isReminderOn;

  /// The subject of the event.
  ///
  /// Can be `null` if the subject is unknown or not provided.
  final String? subject;

  /// A preview of the body of the event.
  ///
  /// Can be `null` if the body preview is unknown or not provided.
  final String? bodyPreview;

  /// The all-day status of the event.
  ///
  /// Can be `null` if the all-day status is unknown or not provided.
  final bool? isAllDay;

  /// The organizer status of the event.
  ///
  /// Can be `null` if the organizer status is unknown or not provided.
  final bool? isOrganizer;

  /// The start time of the event.
  ///
  /// Can be `null` if the start time is unknown or not provided.
  final String? startDateTime;

  /// The end time of the event.
  ///
  /// Can be `null` if the end time is unknown or not provided.
  final String? endDateTime;

  /// A list of `Attendee` objects representing the attendees of the event.
  ///
  /// Can be `null` if the attendees are unknown or not provided.
  final List<Attendee>? attendees;

  /// An `Organizer` object representing the organizer of the event.
  ///
  /// Can be `null` if the organizer is unknown or not provided.
  final Organizer? organizer;

  /// Creates a new instance of `CalendarEvent`.
  ///
  /// All parameters are optional and can be `null`.
  CalendarEvent({
    this.id,
    this.createdDateTime,
    this.lastModifiedDateTime,
    this.isReminderOn,
    this.subject,
    this.bodyPreview,
    this.isAllDay,
    this.isOrganizer,
    this.startDateTime,
    this.endDateTime,
    this.attendees,
    this.organizer,
  });

  /// Creates a new instance of `CalendarEvent` from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of `[CalendarEvent]`.
  /// The '[start]' and 'end' keys should map to JSON objects with a 'dateTime' key.
  /// The '[attendees]' key should map to a list of JSON objects that can be converted to `[Attendee]` objects.
  /// The '[organizer]' key should map to a JSON object that can be converted to an `[Organizer]` object.
  factory CalendarEvent.fromJson(Map<String, dynamic> json) {
    return CalendarEvent(
      id: json['id'],
      createdDateTime: json['createdDateTime'],
      lastModifiedDateTime: json['lastModifiedDateTime'],
      isReminderOn: json['isReminderOn'],
      subject: json['subject'],
      bodyPreview: json['bodyPreview'],
      isAllDay: json['isAllDay'],
      isOrganizer: json['isOrganizer'],
      startDateTime: json['start'] != null ? json['start']['dateTime'] : null,
      endDateTime: json['end'] != null ? json['end']['dateTime'] : null,
      attendees: json['attendees'] != null
          ? (json['attendees'] as List)
              .map((attendee) => Attendee.fromJson(attendee))
              .toList()
          : null,
      organizer: json['organizer'] != null
          ? Organizer.fromJson(json['organizer'])
          : null,
    );
  }

  /// Converts this `CalendarEvent` object to a JSON object.
  ///
  /// Each parameter of [CalendarEvent] corresponds to a key in the resulting JSON object.
  /// The [start] and 'end' keys map to JSON objects with a [dateTime] key.
  /// The [attendees] key maps to a list of JSON objects obtained from the [Attendee] objects.
  /// If the list of attendees is `null`, the [attendees] key maps to `null`.
  /// The [organizer] key maps to a JSON object obtained from the [Organizer] object.
  /// If the [Organizer] object is `null`, the [organizer] key maps to `null`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDateTime': createdDateTime,
      'lastModifiedDateTime': lastModifiedDateTime,
      'isReminderOn': isReminderOn,
      'subject': subject,
      'bodyPreview': bodyPreview,
      'isAllDay': isAllDay,
      'isOrganizer': isOrganizer,
      'start': startDateTime != null ? {'dateTime': startDateTime} : null,
      'end': endDateTime != null ? {'dateTime': endDateTime} : null,
      'attendees': attendees?.map((attendee) => attendee.toJson()).toList(),
      'organizer': organizer?.toJson(),
    };
  }
}

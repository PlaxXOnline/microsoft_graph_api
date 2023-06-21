import '../models.dart';

class CalendarEvent {
  final String? id;
  final String? createdDateTime;
  final String? lastModifiedDateTime;
  final bool? isReminderOn;
  final String? subject;
  final String? bodyPreview;
  final bool? isAllDay;
  final bool? isOrganizer;
  final String? startDateTime;
  final String? endDateTime;
  final List<Attendee>? attendees;
  final Organizer? organizer;

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

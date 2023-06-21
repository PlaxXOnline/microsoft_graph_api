import '../models.dart';

class CalendarEvent {
  final String id;
  final String createdDateTime;
  final String lastModifiedDateTime;
  final bool isReminderOn;
  final String subject;
  final String bodyPreview;
  final bool isAllDay;
  final bool isOrganizer;
  final String startDateTime;
  final String endDateTime;
  final List<Attendee> attendees;
  final Organizer organizer;

  CalendarEvent({
    required this.id,
    required this.createdDateTime,
    required this.lastModifiedDateTime,
    required this.isReminderOn,
    required this.subject,
    required this.bodyPreview,
    required this.isAllDay,
    required this.isOrganizer,
    required this.startDateTime,
    required this.endDateTime,
    required this.attendees,
    required this.organizer,
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
      startDateTime: json['start']['dateTime'],
      endDateTime: json['end']['dateTime'],
      attendees: (json['attendees'] as List)
          .map((attendee) => Attendee.fromJson(attendee))
          .toList(),
      organizer: Organizer.fromJson(json['organizer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDateTime': createdDateTime ?? DateTime.now().toIso8601String(),
      'lastModifiedDateTime': lastModifiedDateTime ?? '',
      'isReminderOn': isReminderOn ?? true,
      'subject': subject ?? '',
      'bodyPreview': bodyPreview ?? '',
      'isAllDay': isAllDay ?? false,
      'isOrganizer': isOrganizer ?? true,
      'start': {'dateTime': startDateTime},
      'end': {'dateTime': endDateTime},
      'attendees': attendees.map((attendee) => attendee.toJson()).toList(),
      'organizer': organizer.toJson(),
    };
  }
}

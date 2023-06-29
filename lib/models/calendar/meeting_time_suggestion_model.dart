import 'calendar_models.dart';

/// Represents a suggested meeting time.
///
/// Each instance holds the confidence level of the suggestion, the organizer's availability,
/// the attendees' availability, the suggested locations, and the suggested time slot.
class MeetingTimeSuggestion {
  /// The confidence level of the suggested meeting time.
  final int? confidence;

  /// The availability of the organizer.
  final String? organizerAvailability;

  /// A list of the attendees' availability.
  final List<AttendeeAvailability?>? attendeeAvailability;

  /// A list of suggested locations for the meeting.
  final List<Location?>? locations;

  /// The suggested time slot for the meeting.
  final TimeSlot? meetingTimeSlot;

  /// Creates a new instance of [MeetingTimeSuggestion].
  ///
  /// All parameters are optional.
  MeetingTimeSuggestion({
    this.confidence,
    this.organizerAvailability,
    this.attendeeAvailability,
    this.locations,
    this.meetingTimeSlot,
  });

  /// Creates a new instance of [MeetingTimeSuggestion] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [MeetingTimeSuggestion].
  factory MeetingTimeSuggestion.fromJson(Map<String, dynamic> json) {
    return MeetingTimeSuggestion(
      confidence: json['confidence'],
      organizerAvailability: json['organizerAvailability'],
      attendeeAvailability: json['attendeeAvailability'] != null
          ? (json['attendeeAvailability'] as List)
              .map((i) => AttendeeAvailability.fromJson(i))
              .toList()
          : null,
      locations: json['locations'] != null
          ? (json['locations'] as List)
              .map((i) => Location.fromJson(i))
              .toList()
          : null,
      meetingTimeSlot: json['meetingTimeSlot'] != null
          ? TimeSlot.fromJson(json['meetingTimeSlot'])
          : null,
    );
  }

  /// Converts this [MeetingTimeSuggestion] object to a JSON object.
  ///
  /// Each parameter of [MeetingTimeSuggestion] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    return {
      'confidence': confidence,
      'organizerAvailability': organizerAvailability,
      'attendeeAvailability':
          attendeeAvailability?.map((e) => e?.toJson()).toList(),
      'locations': locations?.map((e) => e?.toJson()).toList(),
      'meetingTimeSlot': meetingTimeSlot?.toJson(),
    };
  }
}

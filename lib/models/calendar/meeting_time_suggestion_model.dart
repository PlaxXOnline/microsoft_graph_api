import 'calendar_models.dart';

class MeetingTimeSuggestion {
  int? confidence;
  String? organizerAvailability;
  List<AttendeeAvailability?>? attendeeAvailability;
  List<Location?>? locations;
  TimeSlot? meetingTimeSlot;

  MeetingTimeSuggestion({
    this.confidence,
    this.organizerAvailability,
    this.attendeeAvailability,
    this.locations,
    this.meetingTimeSlot,
  });

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

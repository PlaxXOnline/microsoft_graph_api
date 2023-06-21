import 'calendar_models.dart';

class AttendeeAvailability {
  String? availability;
  Attendee? attendee;

  AttendeeAvailability({this.availability, this.attendee});

  factory AttendeeAvailability.fromJson(Map<String, dynamic> json) {
    return AttendeeAvailability(
      availability: json['availability'],
      attendee:
          json['attendee'] != null ? Attendee.fromJson(json['attendee']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'availability': availability,
      'attendee': attendee?.toJson(),
    };
  }
}
